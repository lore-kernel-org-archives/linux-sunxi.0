Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E0143550D
	for <linux-sunxi@lists.linux.dev>; Fri, 24 Jul 2026 14:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784903877; cv=none; b=PS5qu0CGRjmjts/8LwPf41mqEcSId84IyGWuQM9MnLhCEv/FHkEtTR+0mMl/UpqD/3Z5ad3gnmYrG3+ViMankqGIwJbbVrGEkMLRSDjpQ/qtE4s4Ob7GjsJnB2BUsX4xulgQJ3ZTh5QAMZ0LIyM7VfPzLmcKGmSKsFEizfsdh/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784903877; c=relaxed/simple;
	bh=/cGLugEU+pj6weLLlGER1og5Yg+0FROUlFn0hogGiBY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PcTTXapynyb1LwlASZzDSw9UatMZIaHVvaocKkVdI5ALC7NHjy74IU48btaoSZWjyq7t5jSG1U9nm5eqISZ0e9tlvw3+qwEbSn8BAm5EA4jmjC9rFcbqdBb38TiTQH1eP7xI3xaVW5/GCtA1lgfw1wZuFSaNkdmF81jXTF1gYd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nXYKgvS2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nXYKgvS2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D94C1F000E9;
	Fri, 24 Jul 2026 14:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784903873;
	bh=h+3m/a0+VAzpHEtakkcHAOVbiplofwcwQXhXAgAdmno=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nXYKgvS29n+qIyQ1ME988QwxQ8W4AYOmUiAXjF6wWmgriUySe9f9z+bEiz4VOlFcl
	 9tyew5S/SUKYx9LUDiZBO3H5ithhf7fR9lfmOxnANSGJQ3D7Iern+3y8dBXDBtEsSw
	 kFuut+ifkY44FgSZPBYMNp1bfzDu2mbB3JHD27b2tMnlSZqRxQsIOq/3GXXAK6eDcr
	 3DeJlHFIqfRQo/SB99KUjPo4d4HV8EeVRs5JdNksERlnEEFhrKQyuVQDlfXTsAep9G
	 SRLDd84ecCpJJzUhoE92se/O6LWQL4XUi84+TPUfwlQvoiV27hSzpYF6UwnAtt5Tss
	 Dvwn3LQFr3IUQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 3/5] drm/scdc-helper: Implement parsing and printing
 HDMI 2.1 fields
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260724-scdc-link-health-v9-3-bdda406d016d@collabora.com>
References: <20260724-scdc-link-health-v9-0-bdda406d016d@collabora.com>
 <20260724-scdc-link-health-v9-3-bdda406d016d@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 14:37:53 +0000
Message-Id: <20260724143753.8D94C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The SCDC error counter checksum validation incorrectly includes La=
ne 3 error registers, unconditionally breaking SCDC reads when errors occur=
 on 4-lane FRL connections.
- [Medium] The `state->rs_corrections` field is not cleared when the Reed-S=
olomon channel becomes invalid, leaking stale state.
- [Medium] Encountering a reserved FRL rate causes `drm_scdc_read_state` to=
 abort, breaking forward compatibility.
--

--- Patch [3]: [PATCH v9 3/5] drm/scdc-helper: Implement parsing and printi=
ng HDMI 2.1 fields ---
commit da086d3bc120a56452dfbe550079b981dd21770b
Author: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

drm/scdc-helper: Implement parsing and printing HDMI 2.1 fields

This commit implements reading and parsing HDMI 2.1 FRL-specific
fields over SCDC. It extracts FRL rate, FFE levels, Lane 3 error
counters, and Reed-Solomon corrections to output via debugfs.

> diff --git a/drivers/gpu/drm/display/drm_scdc_helper.c b/drivers/gpu/drm/=
display/drm_scdc_helper.c
> --- a/drivers/gpu/drm/display/drm_scdc_helper.c
> +++ b/drivers/gpu/drm/display/drm_scdc_helper.c
[ ... ]
> @@ -286,14 +319,41 @@ drm_scdc_parse_status0_flags(u8 val, struct drm_scd=
c_status_flags *flags)
[ ... ]
> -static int drm_scdc_parse_error_counters(const u8 scdc[256], u16 counter=
[3])
> +static int drm_scdc_parse_error_counters(const u8 scdc[256], u16 counter=
[4],
> +					 unsigned int num_lanes)
>  {
> +	u8 end_reg;
>  	u8 sum =3D 0;
>  	int i;
> =20
> -	for (i =3D SCDC_ERR_DET_0_L; i <=3D SCDC_ERR_DET_CHECKSUM ; i++)
> +	switch (num_lanes) {
> +	case 3:
> +		end_reg =3D SCDC_ERR_DET_CHECKSUM;
> +		break;
> +	case 4:
> +		end_reg =3D SCDC_ERR_DET_3_H;
> +		break;

[Severity: High]
Does this inclusion of Lane 3 error registers break the checksum calculatio=
n?

The SCDC checksum byte (SCDC_ERR_DET_CHECKSUM) only covers bytes up to 0x56.
By setting end_reg to SCDC_ERR_DET_3_H (0x58), the zero-sum calculation will
include the Lane 3 error registers (0x57 and 0x58).=20

If a 4-lane connection experiences any Lane 3 errors, the sum will be non-z=
ero
and cause drm_scdc_parse_error_counters() to abort with -EPROTO, breaking
SCDC reads exactly when errors are present.

> +	default:
> +		return -EINVAL;
> +	}
> +
> +	for (i =3D SCDC_ERR_DET_0_L; i <=3D end_reg; i++)
>  		sum =3D wrapping_add(u8, sum, scdc[i]);
[ ... ]
> @@ -350,11 +417,26 @@ int drm_scdc_read_state(struct drm_connector *conne=
ctor, struct drm_scdc_state *
> =20
>  	state->scrambling_detected =3D buf[SCDC_SCRAMBLER_STATUS] & SCDC_SCRAMB=
LING_STATUS;
> =20
> +	state->rate =3D FIELD_GET(SCDC_FRL_RATE, buf[SCDC_CONFIG_1]);
> +	num_lanes =3D drm_scdc_num_frl_lanes(state->rate);
> +	if (num_lanes < 0)
> +		return num_lanes;

[Severity: Medium]
Will this direct error return abort all SCDC parsing for future FRL rates?

If a newer display uses a currently-reserved FRL rate (e.g., rates 7-15),
drm_scdc_num_frl_lanes() will return -EINVAL.

Propagating this error immediately prevents users from reading any SCDC sta=
te
(including TMDS and scrambling info) for displays with newer reserved rates.

> +	if (!num_lanes)
> +		num_lanes =3D 3;
[ ... ]
> +	ret =3D drm_scdc_parse_error_counters(buf, state->error_count, num_lane=
s);
>  	if (ret)
>  		return ret;
> =20
> +	if (state->rate && (buf[SCDC_ERR_DET_RS_H] & SCDC_CHANNEL_VALID))
> +		state->rs_corrections =3D (buf[SCDC_ERR_DET_RS_H] & ~SCDC_CHANNEL_VALI=
D) << 8 |
> +					buf[SCDC_ERR_DET_RS_L];

[Severity: Medium]
Should state->rs_corrections be explicitly cleared when the channel is inva=
lid?

Unlike the channel error counters which are explicitly zeroed out when
SCDC_CHANNEL_VALID is not set, rs_corrections lacks an else branch.

If the drm_scdc_state structure is reused by a caller instead of being fres=
hly
allocated, this could leak stale Reed-Solomon correction values from a
previous read.

> +
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-scdc-link-=
health-v9-0-bdda406d016d@collabora.com?part=3D3
