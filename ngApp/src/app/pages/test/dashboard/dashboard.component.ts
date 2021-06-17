import { Component, OnInit, Input, ElementRef, Output, EventEmitter, OnChanges, SimpleChanges } from '@angular/core';
import { constants } from 'src/app/utils/constants';
import { Utils } from 'src/app/utils/utils';


@Component({
	selector: 'app-dashboard',
	templateUrl: './dashboard.component.html',
	styleUrls: ['./dashboard.component.css'],
	// providers: [DashboardService]
})

export class DashboardComponent implements OnInit, OnChanges{
	@Output() etapaFiltro = new EventEmitter();
	@Input('filtros') filtros: any;
	@Input('filtrosAscd') filtrosAscd: any;
	@Input('status') status: any;
	@Input('statusAscd') statusAscd: any;
	@Input('tab') tab: number;
	bordStage = false;
	asvdListStatus: any = [];
	statusList = [];

	public constants = constants;

	constructor() 
	{
		this.filtros = {
			stages: 0,
			status: 0,
		}

		this.status = {
			pedido: {
				count: 20,
				indicatorsCount: {
					pedidoCancelado: 10,
					exportadoNaoOtimizado: 10,
					exportadoExcecao: 10,
					pendentes: 10,
				}
			},
			oferta: null,
			deslocamento_cervejaria: null,
			cervejaria: null,
			deslocamento_cliente: {
				count: 50,
				indicatorsCount: {
					noShow: 10,
					riscoDeNoShow: 10,
					naoRastreado: 10,
					parado: 10,
					emTransito: 10,
				}
			},
			execucao_entrega: null,
		}
	}

	public utils = Utils;

	ngOnInit()
	{
		this.statusList = this.utils.getAscdStaticList();
	}
	
	ngOnChanges(changes: SimpleChanges) 
	{
		if(changes.status)
		{
			this.asvdListStatus = this.utils.getListStatus(this.status, this.asvdListStatus);
		}
    }

	public changeIndicatorSelection($evt)
	{
		if (!$evt)
		{
			return;
		}

		if ($evt.path.length < 2 || !$evt.path[1])
		{
			// Não é possível acessar pai
			return;
		}

		let indicatorDivElement: HTMLDivElement = $evt.path[1];

		// Parent não é um indicator-color ou é o que já está selecionado
		if (!indicatorDivElement.classList.contains('color-indicator')
			|| indicatorDivElement.classList.contains('selected-indicator'))
		{
			this.removeIndicatorSelection('selected-indicator');
			// Deve limpar os filtros de indicadores
			return;
		}

		this.removeIndicatorSelection('selected-indicator');
		indicatorDivElement.classList.add('selected-indicator');

		return;
	}
	addFilter(idStage, idStatus? , eventStatus = false){
		if(idStatus != undefined) eventStatus = true;	//verifica se o evento foi disparado pelos status
		this.etapaFiltro.emit([idStage, idStatus, eventStatus]);
	}

	private getEtapaDataFromStatusAscd(etapa)
	{
		let etapaAndIndicadorData = this.statusAscd

		if (etapaAndIndicadorData == null )
		{
			return null;
		}//if
		
		let etapasData = etapaAndIndicadorData.etapas;
		if ( etapasData == null)
		{
			return null;
		}//if

		let etapaData = etapaAndIndicadorData.etapas[etapa];
		return etapaData;
	}//func

	public getCountEtapaTotal(etapa)
	{
		let deprecedEtapas: number[] = this.constants.T2EtapaEntrega.ListDeprecated;

		if (deprecedEtapas.includes(etapa))
		{
			return this.constants.Text.EMPTY_VALUE;
		}//if

		let defaultValue = 0;
		
		let etapaData = this.getEtapaDataFromStatusAscd(etapa);
		if (etapaData == null)
		{
			return defaultValue;
		}//if
		
		let etapaValue = etapaData.total;
		if (etapaValue == null)
		{
			return defaultValue;
		}//if
		return etapaValue;
	}//func

	public getCountIndicadorFromEtapa(etapa, indicador): any
	{
		let deprecedIndicators: number[] = this.constants.T2IndicadorEntrega.ListDeprecated;
		let defaultValue = 0;

		if (deprecedIndicators.includes(indicador))
		{
			return this.constants.Text.EMPTY_VALUE;
		}//if

		if (constants.T2IndicadorEntrega.UNDEFINED_INDICADOR_PEDIDO === indicador)
		{
			return null;
		}//if

		let etapaData = this.getEtapaDataFromStatusAscd(etapa);
		if (etapaData == null)
		{
			return defaultValue;
		}//if

		let indicadoresData = etapaData.indicadores;
		if (indicadoresData == null)
		{
			return defaultValue;
		}//if

		let indicadorValue = indicadoresData[indicador];
		if (indicadorValue == null)
		{
			return defaultValue;
		}//if
		return indicadorValue;
	}//func

	public removeIndicatorSelection(str)
	{
		let elements = document.getElementsByClassName(str);
	
		for (let i = 0; i < elements.length; ++i)
		{
			// aplica regra para todos os elementos de indicadores com classe de seleção
			elements[i].classList.remove(str);
		}
	}

}
