Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FCE3C276E
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Jul 2026 09:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784625013; cv=none; b=touUoIy59YNHuZw3p179PI+OPv3kkTplDqyPISDgQA+fKJTBBR9VlphIFtwsxOpOYqL8m9koYcNp44ex2Ru6vAcL6DuesITCR0Q0OzOBZvddb5cKAIyJNOd6HfeTYVexDooG85YBNlHtHEk9AQcA2uMDgCJxaEsbkdaM0Gow/Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784625013; c=relaxed/simple;
	bh=IA46bn06aPQP3+Cho49iFLaFbXTlWYUmrhpqhBkZ5LI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eb3S1E8R0ugTh7Flg9PsQY78r/V8LVbmVP4nx+xxzzcKy5T0XfBS/NHPuVshpwOukRS1W2q1jPi6JyYJnPTls1mOronLBzXwAafIeX6atFaP1vMW9mU6yxQjnKo8bdMpd4Bwe3+QdIS5bnXg7q0DgDFLxjfeeZG1p0ELBCxG4W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PRvCKDU0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PRvCKDU0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B387A1F000E9;
	Tue, 21 Jul 2026 09:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784625012;
	bh=qWY53aVvClSZ7kOPkXL0T+NQpbUbqhuUc0KV4Rbz2jY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PRvCKDU0CbPwNQr9CZyr7Kkh7NKKS9BoBHlaVDiK/ojJOtab2Gcv3dBLTbQ91BiC/
	 iPrwWrcVEa4IVhHfVNXuvONfMUHDM3quKWSS4nXwZ3reqb4lRksTEsCGvs5EXSgoDE
	 JObtZ9xGuEoOBgjZE3+2vGD8ekGqxiB1kZEqotg2/ea52QR3Ric2l/zpA0MnTd1Yrw
	 Q1BjaIKa3FQedcssrAzgVAWx1WJJf/pXCqea74RY+eHteACNJkTOeQfGP8OVRsPqV3
	 o1UBk25u3AfMueiugtU9QcE2ywU/zz8SAW2Vj9XZko/PzXYauusMLp4rdcvTqb5jo3
	 S6n3F62/uTIEw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/5] drm/scdc-helper: Add scdc_status debugfs entry
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260721-scdc-link-health-v7-2-92df1b6ad5fc@collabora.com>
References: <20260721-scdc-link-health-v7-0-92df1b6ad5fc@collabora.com>
 <20260721-scdc-link-health-v7-2-92df1b6ad5fc@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 09:10:11 +0000
Message-Id: <20260721091011.B387A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Shared `scdc_debugfs_priv` state causes a data race on concurrent =
debugfs reads and leaks memory for dynamic connectors.
- [Medium] Connector `status` and `display_info` fields are accessed withou=
t holding the required DRM mode config mutex.
--

--- Patch [2]: [PATCH v7 2/5] drm/scdc-helper: Add scdc_status debugfs entr=
y ---
commit 16b712ae50ae43d528857efe5b800f5abdef139f
Author: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

drm/scdc-helper: Add scdc_status debugfs entry

This commit adds a debugfs entry under the DRM connector to expose SCDC link
status information.

> diff --git a/drivers/gpu/drm/display/drm_scdc_helper.c b/drivers/gpu/drm/=
display/drm_scdc_helper.c
> index 8403f2390ab6a..5871fc101815d 100644
> --- a/drivers/gpu/drm/display/drm_scdc_helper.c
> +++ b/drivers/gpu/drm/display/drm_scdc_helper.c
[ ... ]
> @@ -276,3 +284,179 @@ bool drm_scdc_set_high_tmds_clock_ratio(struct drm_=
connector *connector,
[ ... ]
> +static int scdc_status_show(struct seq_file *m, void *data)
> +{
> +	struct scdc_debugfs_priv *priv =3D m->private;
> +	struct drm_scdc_state *st =3D &priv->state;
> +	struct drm_connector *connector =3D priv->connector;
> +	struct drm_scdc *scdc =3D &connector->display_info.hdmi.scdc;
> +	int i, ret;
> +
> +	drm_connector_get(connector);
> +
> +	if (connector->status !=3D connector_status_connected) {

[Severity: Medium]
Are we missing a lock here? Reading connector->status and=20
connector->display_info (such as scdc->supported below) without holding the=
=20
required drm_mode_config.mutex might race with concurrent modeset or hotplu=
g=20
events, potentially leading to torn reads or an inconsistent state.

> +		ret =3D -ENODEV;
> +		goto err_conn_put;
> +	}
> +
> +	if (scdc->supported) {
> +		ret =3D drm_scdc_read_state(connector, st);

[Severity: High]
Can this cause a data race? Multiple processes reading this debugfs file
concurrently will simultaneously mutate the shared priv->state buffer insid=
e=20
drm_scdc_read_state(), leading to corrupted state data being displayed.

> +		if (ret)
> +			goto err_conn_put;
> +
> +		for (i =3D 0; i < ARRAY_SIZE(st->scdc); i +=3D 16)
> +			seq_printf(m, "%*ph\n", 16, &st->scdc[i]);
> +
> +		seq_puts(m, "\n----------------\n\n");
> +	}
[ ... ]
> +void drm_scdc_debugfs_init(struct drm_connector *connector, struct dentr=
y *root)
> +{
> +	struct scdc_debugfs_priv *priv;
> +
> +	if (!root || !connector)
> +		return;
> +
> +	priv =3D drmm_kzalloc(connector->dev, sizeof(*priv), GFP_KERNEL);

[Severity: High]
Does this leak memory on hot-unplug? Allocating the priv structure using=20
drmm_kzalloc() ties its lifetime to the DRM device rather than the connecto=
r.=20
For dynamic hotpluggable connectors (like DP MST), this memory might not be=
=20
freed when the connector is destroyed.

> +	if (!priv)
> +		return;
> +
> +	priv->connector =3D connector;
> +
> +	debugfs_create_file("scdc_status", 0444, root, priv, &scdc_status_fops);
> +}
> +EXPORT_SYMBOL(drm_scdc_debugfs_init);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-scdc-link-=
health-v7-0-92df1b6ad5fc@collabora.com?part=3D2
