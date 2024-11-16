// (false && undefined);
// (false || undefined);
// ((false && undefined) || (false || undefined));
// ((false || undefined) || (false && undefined));
// ((false && undefined) && (false || undefined));
// ((false || undefined) && (false && undefined));
// ('a' || (false && undefined) || '');
// ((false && undefined) || 'a' || '');
// ('a' && (false || undefined) && '');
// ((false || undefined) && 'a' && '');

// false
// undefined
// undefined
// false
// false
// undefined
// 'a'
// 'a'
// undefined
// undefined
