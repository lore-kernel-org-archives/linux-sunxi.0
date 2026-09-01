Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC4A20D4F0
	for <linux-sunxi@lists.linux.dev>; Tue,  1 Sep 2026 19:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289642; cv=none; b=udOdsxUwmQsLAfyxWvfN2fvFp2uuLBFHacqhvAC0iUljji15Sl4InOi99jCS98nAhOPeeBhCTH2X1C782Itt2I9Kf9+wKoi3lWhHJinEXA2uBAGkBr1dV+v5qIKKm/Lul4svuobGMudIhqeeDfQjIi9YS+pazrYTGZVs/zeS1eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289642; c=relaxed/simple;
	bh=YMhQfM+VZ4vW2UH3xpl2Vn1Nos3aKda4EdGTlBOl0qI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KcZ1gM6RVwV4mhc8X1G9Qp48Zdg8WKLWPOyeZ+LJUerdfis381gncXnDbh6273izkQ0qylybMlDQ5jKV5Hanjrj3hydQ0WlJz1efunWgzKJ6LFNrdZGIGGPgQCnrKXt/NESPDbi1OJ+dr8MjEsQsg1/4Y6XQhFFhbSnHjbxipgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B7rDSaVd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B7rDSaVd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EB631F000E9;
	Tue,  1 Sep 2026 19:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788289641;
	bh=4P3BM0dOlz3Y4asZq0ovct0hFO2d66ps8HtQlFL3pPQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B7rDSaVdNxneUYWTEi1IttDl8hAK0lCS+N73h0ijRMdmvF38Cbk1002bw+J6Qo2JO
	 U8S9oS7BeDWjwQvui/0nj2tN757Ud0UWcD+yhfyU0iY0k2yuMkP4P1t2j5cizy+9Ac
	 pMjIzh7+/ihMPOEP+Ck2p/6nWeT0/g/hIqsWG4u5ENX28SN3rXReGRovsEzzx0ZYxn
	 /LqMTeJfDKEmNFeNno12qzmn4mh0XDMsvaKHOKqF5deEFCzhvvbyaaZLoDRUUdNAY3
	 jgrfjtAdp8DwOWEjaQikcMxm6fdflLJTeD792eVtLNMoB6Z/aDUl9evyfGUyl6ac3b
	 kmVEDA2IpKIYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 02/74] drm/connector: hdmi: Handle reset() state
 allocation failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-2-bc12954a0688@collabora.com>
References: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
 <20260901-dw-hdmi-qp-scramb-v11-2-bc12954a0688@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 19:07:20 +0000
Message-Id: <20260901190721.2EB631F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The newly added NULL check for `connector->state` in `drmm_connect=
or_hdmi_init()` fails to prevent crashes on memory allocation failure for m=
ain HDMI drivers (e.g., `vc4`, `sun4i`) and the testing infrastructure, bec=
ause their `reset` hooks unconditionally dereference the state before retur=
ning.
--

commit 424f1b968bca06b1916973328efd3feb5a119e0e
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

drm/connector: hdmi: Handle reset() state allocation failure

This commit adds a check for connector->state after calling the reset
callback in drmm_connector_hdmi_init() to avoid a NULL pointer dereference
if memory allocation fails.

Link: https://lore.kernel.org/all/20260723015306.C94241F000E9@smtp.kernel.o=
rg/

> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 8b4baed060f3a..0e39431e85b20 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -628,6 +628,8 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
>  		connector->state =3D state;
>  	} else if (connector->funcs->reset) {
>  		connector->funcs->reset(connector);
> +		if (!connector->state)
> +			return -ENOMEM;

[Severity: High]
This isn't a bug introduced by this patch, but doesn't the system crash
before it can even reach this new check on memory allocation failure?

If drm_atomic_helper_connector_reset() fails to allocate memory, it sets
connector->state to NULL. Several driver-specific reset hooks then
immediately dereference it by unconditionally passing it to
__drm_atomic_helper_connector_hdmi_state_init().

For example, in drivers/gpu/drm/vc4/vc4_hdmi.c:vc4_hdmi_connector_reset():

	drm_atomic_helper_connector_reset(connector);
	__drm_atomic_helper_connector_hdmi_state_init(connector, connector->state);

The sun4i driver has the exact same pattern in sun4i_hdmi_connector_reset(),
and the testing infrastructure will also panic the KUnit framework in
dummy_hdmi_connector_reset() from
drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c under the same condition=
s.

Could these driver reset hooks be updated to handle the NULL state graceful=
ly,
so that this new check can successfully prevent the panic?

>  	}
> =20
>  	drm_connector_attach_max_bpc_property(connector, 8, max_bpc);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-dw-hdmi-qp=
-scramb-v11-0-bc12954a0688@collabora.com?part=3D2
