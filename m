Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D708F7080D
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jul 2026 02:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784772069; cv=none; b=pm9sofsyH84dI7a8kioYm61rdgOnGSP1MIdPrDE8qARehhDBVh91DHnOHEVbZ7cuvJLx/jLs1EbaUcJ6Ed1YjVkR0MPtS79Av2viJyXtEdqKiOSeWo1jXkcNTZGy53WHQ0I51ZwAbmy8qbeJgwJvDnMegEseZZXlGiVYFW0+Tao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784772069; c=relaxed/simple;
	bh=CQEaSWkGcbfXVMTdtBXZdOFjoh8rA8aOlUv9tCgQ7QA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m6U1i8wxhrGYYsGl2A5/gdBUiBXofwomJiBaSD7+vnUb048UQuQxdGeczvifbNNp2DIFSXzNEgWk9jtKM8f3zqCEQ19NlGH3U+1gN6YFt0g6rw+2f09WvHVHCXB8gEoGm/+8Wl4yN/mCKtoY7Zq/CutBOIk0zQjcdDyK40DM0Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mRwKWptb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mRwKWptb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 519551F000E9;
	Thu, 23 Jul 2026 02:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784772068;
	bh=s3yMrTWvUp9juJgceu9qtZDFP+ds1g1rAbkb1qGHm7k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mRwKWptbO4nTuXiLIJCiI2aFMHzON8XcGJRIsDC+qn35OZwT9l4DHnFEOnuftgpL7
	 hzxHGjzctiJcoLRA1jLYZ4OyBK3qpMDDjx4S1lmhlx9CynsT79aICiTKlj/IxI6IKp
	 hSgaYrzxS/D1HqTHqyxOERDJnM0vkc917yf7vxqFnaRkuQf8DUg28T5AJhmFsKe1Kb
	 0C7D64l2uX3CaV6+N9RZFJx0MukDde4ZbvmLE85Yr7glp21UNfAzEio9QwwPd0mNsP
	 Qs94hajCdxGBp4vSknv5BC2mzYuXEkZAl1FUBM4BFlCV7Su8hUt+E7LMuD/vlh96Re
	 FDd+f7Wmj9H+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 58/61] drm/connector: Remove
 drmm_connector_hdmi_ini2()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-58-4fb12ea22ac9@collabora.com>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
 <20260723-dw-hdmi-qp-scramb-v9-58-4fb12ea22ac9@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 02:01:07 +0000
Message-Id: <20260723020108.519551F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incomplete transition and missed cleanup of TODOs for HDMI conne=
ctor state fields.
--

--- Patch [58]: [PATCH v9 58/61] drm/connector: Remove drmm_connector_hdmi_=
ini2() ---
commit bc0f9c01790d98f211c2100593457435fcb56011
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

    drm/connector: Remove drmm_connector_hdmi_ini2()

This commit removes the transitional drmm_connector_hdmi_ini2() function
since all callers have been converted to the new drmm_connector_hdmi_init()
signature.

> All callers have been converted to the new drmm_connector_hdmi_init()
> signature.  Remove the transitional drmm_connector_hdmi_ini2() function,
> its declaration, its EXPORT_SYMBOL() and its kernel-doc.

[Severity: Medium]
If the transition is now complete, were the TODO cleanups in
drmm_connector_hdmi_init() missed?

There are still assignments left with explicit TODO comments in
drivers/gpu/drm/drm_connector.c:

	/* TODO: remove after conversion to new drmm_connector_hdmi_init() */
	connector->hdmi.supported_formats =3D hdmi_funcs->supported_formats;
	...
	/* TODO: remove after conversion to new drmm_connector_hdmi_init() */
	strtomem_pad(connector->hdmi.vendor, hdmi_funcs->vendor, 0);
	strtomem_pad(connector->hdmi.product, hdmi_funcs->product, 0);
	...
	/* TODO: remove after conversion to new drmm_connector_hdmi_init() */
	connector->max_bpc =3D hdmi_funcs->max_bpc;

Additionally, external consumers still appear to rely on the duplicated
state fields rather than using the funcs structure. For instance, in
drivers/gpu/drm/display/drm_hdmi_state_helper.c:

	if (!(connector->hdmi.supported_formats & BIT(format))) {

Since this patch marks the end of the transition, should these duplicated
fields be removed and their users updated to use
connector->hdmi.funcs->supported_formats instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-dw-hdmi-qp=
-scramb-v9-0-4fb12ea22ac9@collabora.com?part=3D58
