export const kAppEnvStg = process.env['FLAVOR'] === 'stg';
export const kAppEnvProd = process.env['FLAVOR'] === 'prod';

export const kVertexAiSearchDatastore
  = kAppEnvProd
    ? 'projects/blooms-prod-43d74/locations/global/collections/default_collection/dataStores/blooms_1737358325708'
    : 'projects/blooms-stg/locations/global/collections/default_collection/dataStores/blooms_1736509271412';
