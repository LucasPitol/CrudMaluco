import { Router } from "@angular/router";
import { constants } from "./constants";
import * as moment from "moment";

export const Utils = 
{
	getClassWithColor: function(card, status) {
		let classCss: string = "";
		switch (status.color) {
			case 1:
				classCss = "red";
				break;
			case 2:
				classCss = "yellow";
				break;
			case 3:
				classCss = "green";
				break;
			case 4:
				classCss = "green";
				break;
			default:
				break;
		}
		if (status.status === card.StatusOrder && status.color != 4) {
			classCss = classCss + "-now";
		}
		return classCss;
	},

	getColorClassBy(indicadorOnActualEtapa, indicatorOnEtapa)
	{
		let classCss: string;
		if (indicatorOnEtapa != null)
		{
			switch(indicatorOnEtapa)
			{
				case constants.T2IndicadorEntrega.DEVOLVIDO:
					classCss = "red";
					break;

				case constants.T2IndicadorEntrega.NO_SHOW:
					classCss = "red";
					break;

				case constants.T2IndicadorEntrega.EM_ROTA_DE_ENTREGA:
					classCss = "yellow";
					break;
					
				case constants.T2IndicadorEntrega.EM_ESTADIA:
					classCss = "yellow";
					break;

				case constants.T2IndicadorEntrega.ENTREGA_PARCIAL:
					classCss = "yellow";
					break;
					
				case constants.T2IndicadorEntrega.CARREGADO:
					classCss = "green";
					break;

				case constants.T2IndicadorEntrega.EM_ANDAMENTO:
					classCss = "green";
					break;

				case constants.T2IndicadorEntrega.ENTREGUE:
					classCss = "green";
					break;

				case constants.T2IndicadorEntrega.FINALIZADO:
					classCss = "green";
					break;
				default:
				{
					throw new Error("Invalid indicador '" + indicatorOnEtapa + "'");
				}
			}
		}
		else
		{
			classCss = "";
		}
		if( (indicadorOnActualEtapa == indicatorOnEtapa )
			&& ( indicatorOnEtapa !== constants.T2IndicadorEntrega.CARREGADO )
			&& ( indicatorOnEtapa !== constants.T2IndicadorEntrega.ENTREGUE )
			&& ( indicatorOnEtapa !== constants.T2IndicadorEntrega.FINALIZADO ) )
		{
			classCss = classCss + "-now";
		}
		return classCss;
	},

	addDaysToDate: function(date: Date, days: any): Date {
		var newDate = new Date(date);
		// 86400000 = quantidade de milissegundos referentes a um dia
		newDate.setTime(newDate.getTime() + days * 86400000);
		return newDate;
	},
	
	goToVisaoPedidos: function(idPedido: number, router: Router)
	{
		router.navigate(["visaopedidos/" + idPedido]);
	},

	goToVisaoEntregas: function(idEntrega: number, router: Router)
	{
		router.navigate(["visaoentregas/" + idEntrega]);
	},
	
	getIconBy(etapa, area)
	{
		if (etapa == null)
		{
			return null;
		}//if

		let icon: string;
		switch(etapa)
		{
			case constants.T2EtapaEntrega.PEDIDO:
				icon  = 'ti-file';
				break;
			case constants.T2EtapaEntrega.CD:
				icon = 'ti-package';
				break;
			case constants.T2EtapaEntrega.DESLOCAMENTO_CLIENTE:
				icon = 'truck-full' + area;
				break;
			case constants.T2EtapaEntrega.EXECUCAO_DE_ENTREGA:
				icon = 'ti-clipboard';
				break;
			case constants.T2EtapaEntrega.RETORNO_A_ORIGEM:
				icon = 'ti-back-right';
				break;
			default :
			{
				throw new Error("Invalid etapa '" + etapa + "'");
			}
		}
		return icon;
	},
	
	getListStatus: function(status, asvdListStatus)
	{
		if(status.pedido != undefined)
		{
			let pedidoIndicator = [status.pedido.indicatorsCount]
			.map(item => [item.pedidoCancelado, item.exportadoNaoOtimizado, item.exportadoExcecao, item.pendentes]);
			let ofertaIndicator = [status.oferta.indicatorsCount]
			.map(item => [item.trechoSemTarifa, item.semAceite, item.emOferta, item.emPreOferta]);
			let deslocCervIndicator = [status.deslocamento_cervejaria.indicatorsCount]
			.map(item => [item.furo, item.riscoDeFuro, item.naoRastreadoCervejaria, item.semCheckIn, item.emDeslocamento]);
			let cervejariaIndicator = [status.cervejaria.indicatorsCount]
			.map(item => [item.furo, item.riscoDeNoShow, item.aguardando, item.carregando, item.carregado]);
			let deslocClienteIndicator = [status.deslocamento_cliente.indicatorsCount]
			.map(item => [item.noShow, item.riscoDeNoShow, item.naoRastreado, item.parado, item.emTransito]);
			let execEntregaIndicator = [status.execucao_entrega.indicatorsCount]
			.map(item => [item.devolucao, item.devolucaoEmAnalise, item.alertaDevolucao, item.emEstadia, item.emAlerta, item.emAndamento, item.finalizado, item.finalizadoManualmente]);
			
			asvdListStatus = [
				{value: status.pedido, indicatorValue: pedidoIndicator, status: 1},
				{value: status.oferta, indicatorValue: ofertaIndicator, status: 2},
				{value: status.deslocamento_cervejaria, indicatorValue: deslocCervIndicator, status: 3},
				{value: status.cervejaria, indicatorValue: cervejariaIndicator, status: 4},
				{value: status.deslocamento_cliente, indicatorValue: deslocClienteIndicator, status: 5},
				{value: status.execucao_entrega, indicatorValue: execEntregaIndicator, status: 6}
			]
		}
		return asvdListStatus;
	},

	getAscdStaticList()
	{
		let pedidoIndicatorName = [{  color: 'grey', status: constants.T2IndicadorEntrega.UNDEFINED_INDICADOR_PEDIDO}];
		let cdIndicatorName = [{ color: 'grey', status: constants.T2IndicadorEntrega.CARREGANDO}, 
							{ color: 'blue', status: constants.T2IndicadorEntrega.CARREGADO}];
		let deslocClienteIndicatorName = [{name: 'Risco de no show', color: 'grey', status: constants.T2IndicadorEntrega.RISCO_DE_NO_SHOW}, 
							{ color: 'yellow', status: constants.T2IndicadorEntrega.EM_ROTA_DE_ENTREGA}, 
							{ color: 'grey', status: constants.T2IndicadorEntrega.NAO_RASTREADO}];
		let execEntregaIndicatorName = [{ color: 'red-alert', status: constants.T2IndicadorEntrega.DEVOLVIDO}, 
							{ color: 'yellow', status: constants.T2IndicadorEntrega.EM_ESTADIA}, 
							{ color: 'grey', status: constants.T2IndicadorEntrega.EM_ANALISE_DE_DEV}, 
							{ color: 'green', status: constants.T2IndicadorEntrega.EM_ANDAMENTO}, 
							{ color: 'yellow', status: constants.T2IndicadorEntrega.ENTREGA_PARCIAL}, 
							{ color: 'blue', status: constants.T2IndicadorEntrega.ENTREGUE}];
		let retornoCdIndicatorName = [{color: 'red-alert', status: constants.T2IndicadorEntrega.NO_SHOW}, 
							{color: 'grey', status: constants.T2IndicadorEntrega.RETORNANDO}, 
							{color: 'blue', status: constants.T2IndicadorEntrega.FINALIZADO}];
		
		let staticList = [{ icon: 'ti-file', statusList: pedidoIndicatorName, etapa : constants.T2EtapaEntrega.PEDIDO}, 
							{ icon: 'ti-package', statusList: cdIndicatorName, etapa : constants.T2EtapaEntrega.CD}, 
							{ icon: 'truck-full', statusList: deslocClienteIndicatorName, etapa : constants.T2EtapaEntrega.DESLOCAMENTO_CLIENTE}, 
							{icon: 'ti-clipboard', statusList: execEntregaIndicatorName, etapa : constants.T2EtapaEntrega.EXECUCAO_DE_ENTREGA},
							{ icon: 'ti-back-right', statusList: retornoCdIndicatorName, etapa : constants.T2EtapaEntrega.RETORNO_A_ORIGEM}];
		return staticList;
	},



	verifyValue(value)
	{
		return this.formatValue(value);
	},

	isNullOrEmpty(value)
	{
		return(value === null) || (value === "");
	},

	formatValue(value)
	{
		if(this.isNullOrEmpty(value))
		{
			return constants.Text.EMPTY_VALUE;
		}
		return value;
	},

	formatBoolean(value)
	{
		if (value == null)
		{
			return constants.Text.EMPTY_VALUE;
		}//if
		if (value)
		{
			return constants.Text.TRUE;
		}//if
		return constants.Text.FALSE;
	},//func

	formatHourWithDefaultFormat(value)
	{
		if(value == null)
		{
			return constants.Text.EMPTY_VALUE;
		}
		return value.substring(0,5);
	},

	formatDateWithDefaultFormat( value )
	{
		if(value == null)
		{
			return constants.Text.EMPTY_VALUE;
		}
		return moment(value).format(constants.DateFormat.FORMAT_DATE);
	},//func

	formatTimeWithDefaultFormat(value)
	{
		if(value == null)
		{
			return constants.Text.EMPTY_VALUE;
		}
		const formatted = moment.utc(value * 1000).format(constants.DateFormat.FORMAT_TIME);
		return 	formatted;
	},//func

	formatDateTimeWithDefaultFormat(value)
	{
		if(value == null)
		{
			return constants.Text.EMPTY_VALUE;
		}
		return moment(value).format(constants.DateFormat.FORMAT_DATE_TIME);
	},//func
	
	getViagemStatusText(viagemStatus)
	{
		if (this.isNullOrEmpty(viagemStatus))
		{
			return constants.Text.EMPTY_VALUE;
		}
		let viagemStatusStr;
		switch(viagemStatus)
		{
			case constants.T2ViagemStatus.NAO_INICIADA:
				viagemStatusStr = 'Não Iniciada';
				break;
			case constants.T2ViagemStatus.EM_ANDAMENTO:
				viagemStatusStr = 'Em Andamento';
				break;
			case constants.T2ViagemStatus.FINALIZADA:
				viagemStatusStr = 'Finalizada';
				break;
			default :
			{
				throw new Error("Invalid viagemStatus '" + viagemStatus + "'");
			}

		}
		return viagemStatusStr;
	},
	
	getEtapaText(etapa)
	{
		if (this.isNullOrEmpty(etapa))
		{
			return constants.Text.EMPTY_VALUE;
		}
		let etapaStr;
		switch(etapa)
		{
			case constants.T2EtapaEntrega.PEDIDO:
				etapaStr = 'PEDIDO';
				break;
			case constants.T2EtapaEntrega.CD:
				etapaStr = 'CD';
				break;
			case constants.T2EtapaEntrega.DESLOCAMENTO_CLIENTE:
				etapaStr = 'DESLOCAMENTO CLIENTE';
				break;
				
			case constants.T2EtapaEntrega.EXECUCAO_DE_ENTREGA:
				etapaStr = 'EXECUCAO ENTREGA';
				break;
				
			case constants.T2EtapaEntrega.RETORNO_A_ORIGEM:
				etapaStr = 'RETORNO CD';
				break;
			default :
			{
				throw new Error("Invalid etapa '" + etapa + "'");
			}

		}
		return etapaStr;
	},

	getIndicadorText(indicador)
	{
		if (this.isNullOrEmpty(indicador))
		{
			return constants.Text.EMPTY_VALUE;
		}
		let indicadorStr;
		switch(indicador)
		{
			case constants.T2IndicadorEntrega.CARREGANDO:
					indicadorStr = 'CARREGANDO';
					break;	
			case constants.T2IndicadorEntrega.CARREGADO:
					indicadorStr = 'CARREGADO';
					break;	
			case constants.T2IndicadorEntrega.RISCO_DE_NO_SHOW:
					indicadorStr = 'RISCO DE NO SHOW';
					break;	
			case constants.T2IndicadorEntrega.EM_ROTA_DE_ENTREGA:
					indicadorStr = 'EM ROTA DE ENTREGA';
					break;	
			case constants.T2IndicadorEntrega.NAO_RASTREADO:
					indicadorStr = 'NÃO RASTREADO';
					break;	
			case constants.T2IndicadorEntrega.EM_ANDAMENTO:
					indicadorStr = 'EM ANDAMENTO';
					break;	
			case constants.T2IndicadorEntrega.EM_ESTADIA:
					indicadorStr = 'EM ESTADIA';
					break;	
			case constants.T2IndicadorEntrega.EM_ANALISE_DE_DEV:
					indicadorStr = 'DEV. EM ANÁLISE';
					break;	
			case constants.T2IndicadorEntrega.DEVOLVIDO:
					indicadorStr = 'DEVOLVIDO';
					break;	
			case constants.T2IndicadorEntrega.ENTREGA_PARCIAL:
					indicadorStr = 'ENTREGA PARCIAL';
					break;	
			case constants.T2IndicadorEntrega.ENTREGUE:
					indicadorStr = 'ENTREGUE';
					break;	
			case constants.T2IndicadorEntrega.RETORNANDO:
					indicadorStr = 'RETORNANDO';
					break;	
			case constants.T2IndicadorEntrega.FINALIZADO:
					indicadorStr = 'FINALIZADO';
					break;	
			case constants.T2IndicadorEntrega.NO_SHOW:
					indicadorStr = 'NO SHOW';
					break;
			case constants.T2IndicadorEntrega.UNDEFINED_INDICADOR_PEDIDO:
					indicadorStr = "STATUS A DEFINIR"
					break;
			default :
			{
				throw new Error("Invalid indicador '" + indicador + "'");
			}

		}
		return indicadorStr;
	},

	changeButtonVerMaisVerMenos(value)
	{
		return !value ? "Ver mais" : "Ver menos";
	},

	verifyInplantGerencialUser(inplantProfile: string): boolean
	{
		return inplantProfile === 'Inplant-Gerencial' ?  true :  false;
	}

};