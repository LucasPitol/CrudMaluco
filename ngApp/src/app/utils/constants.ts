let constantsTemp =
{
	cities:
	{
		RIO_DE_JANEIRO: "Rio de Janeiro",
		SAO_PAULO: "São Paulo",
		BELEM_DO_PARA: "Belem do Pará",
	},

	
	ufs: {
		1: "RJ"
	},

	PageTab:
	{
		TAB_ASVD_DASHBOARD: 1,
		TAB_ASCD_DASHBOARD: 2,
		TAB_GESTAO: 3,
		TAB_CALENDAR: 4
	},
	PageType:
	{
		PAGE_TYPE_DASHBOARD: 1,
		PAGE_TYPE_GESTAO: 2,
		PAGE_TYPE_CALENDAR: 3
	},

	T2EtapaEntrega:
	{
		PEDIDO: 5,
		CD: 1,
		DESLOCAMENTO_CLIENTE: 2,
		EXECUCAO_DE_ENTREGA: 3,
		RETORNO_A_ORIGEM: 4,
		ListSorted: null,
		ListDeprecated: null,
	},

	T2IndicadorEntrega:
	{
		//STATUS DA ETAPA CD
		CARREGANDO: 10,
		CARREGADO: 11,

		//STATUS DA ETAPA DESLOCAMENTO CLIENTE
		RISCO_DE_NO_SHOW: 20,
		EM_ROTA_DE_ENTREGA: 21,
		NAO_RASTREADO: 22,

		//STATUS DA ETAPA EXECUCAO DE ENTREGA
		EM_ANDAMENTO: 30,
		EM_ESTADIA: 31,
		EM_ANALISE_DE_DEV: 32,
		DEVOLVIDO: 33,
		ENTREGA_PARCIAL: 34,
		ENTREGUE: 35,

		//STATUS DA ETAPA RETORNO A ORIGEM
		RETORNANDO: 40,
		FINALIZADO: 41,
		NO_SHOW: 42,

		//STATUS DA ETAPA RETORNO A ORIGEM
		UNDEFINED_INDICADOR_PEDIDO: -1,
		ListDeprecated: null,
	},
	T2ViagemStatus:
	{
		NAO_INICIADA: 1,
		EM_ANDAMENTO: 2,
		FINALIZADA: 3,
	},

	DateFormat:
	{
		FORMAT_DATE: "DD/MM/YYYY",
		FORMAT_DATE_TIME: "DD/MM/YYYY HH:mm",
		FORMAT_TIME: "HH:mm",
	},
	Text:
	{
		EMPTY_VALUE: "---",
		TRUE: "Sim",
		FALSE: "Não",
	},
	truckIconNumber:
	{
		TRUCKFULL1: '1',
		TRUCKFULL2: '2',
		TRUCKFULL3: '3'
	},
	managementMenu:
	[
		{
			NAME: "Redes",
			ICON: "ti-world",
			REDIRECTION: 1,
			SUB_ABA: false
		},
		{
			NAME: "Lojas",
			ICON: "ti-home",
			REDIRECTION: 2,
			SUB_ABA: false
		},
		// {
		// 	NAME: "Cervejarias",
		// 	ICON: "icon-brewery",
		// 	REDIRECTION: null,
		// 	SUB_ABA: false,
		// },
		{
			NAME: "Hubs",
			ICON: "ti-location-pin",
			REDIRECTION: 3,
			SUB_ABA: false,
		},
		{
			NAME: "Agendas",
			ICON: "ti-calendar",
			REDIRECTION: 4,
			SUB_ABA: false,
		},
	]
	
};
// let citiesStr: string[] = 
// [
// 	"Rio de Janeiro",
// 	"São Paulo",
// 	"Belem do Pará"
// ]


export const constants = constantsTemp; 
