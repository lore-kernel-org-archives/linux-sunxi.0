Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E722C027E
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Jun 2026 14:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781446091; cv=none; b=eaHe2aSasffjLGng+bt0YantAOTpvPXFs43DpVX6qNZzpWvRJcQPGn11LqCdH2WOxQ3XoJy0dBq9EY+BdcK3/+5iG79F5nAtrdfTCvB+myOSx66vH/TGjDDfzfznveNAN103WBvOjQZdSrXe1FIKzXbba01jo0tPEkCGWMA4X/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781446091; c=relaxed/simple;
	bh=vZ6sLuNEBwb2pkhd5qu/rn+wBwxOy1DXeVTlXK6rZDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EnQk45keAUIha3Wzd2wIEsJ+D3Rslh6gXnrdAMJkoRg+lDZEpQEvW1o2B8Zbhc+5uMt4vcTTfFXhXpuEJtg3zNq8NTbeQLKEKlK+Pk5+2Idf/SWQZZeUGtdJgIZ0VK0tPwnQo+DxUIJtDXdhMW9V6xq85V6ozT2XE9NHd1kPT6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lKOvfYdI; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lKOvfYdI"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45ef616daf6so2758591f8f.3
        for <linux-sunxi@lists.linux.dev>; Sun, 14 Jun 2026 07:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781446089; x=1782050889; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZ6sLuNEBwb2pkhd5qu/rn+wBwxOy1DXeVTlXK6rZDU=;
        b=lKOvfYdInHZKw09gd66zGMzTU4iIxInF53Z80qJaKmILvRReeSywkC2No7bw/+/RBB
         1kTsT0w1w+eIQqP27ssd9TyWzqq45stIphiko8FDvOpk9sJFy5QG4ewf9eBwfeKSUrxY
         0WEb4hM1nmTnmYVnNdG6wZRhYMRIIVRpl/dkIAHB6gOxomt22fP2qcwYni4BS9GnCjTX
         mRokdNmGuHX8qVAGzlz5EvFOKuC6wNo+MB862UxJzQVPKmvndB+onWWurcJYW2gZdCPS
         34QWTi/pSUHGAeq3U6Dq4rkZBIlS+TBq23j+dwv/ahNBClwSByV4CKoodnUKJSQS0jEL
         zjyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781446089; x=1782050889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vZ6sLuNEBwb2pkhd5qu/rn+wBwxOy1DXeVTlXK6rZDU=;
        b=Ync3j7GCS6mx+qg1a+s+bDlEZ9RpgkPKmnCoig0salfMaw8fFc7HFc5DcCGp+XGmr8
         vD85pGf8Gd9CYYzYNFgv25qaSFAaclDZIbX+pFyXaSOFL14IOBCpm3ZspDKPasfwpBDW
         PMQ3P2SBDwAWqv49OAzh53FX0Aqbdc0Tj80bkEMWrzwOa2avMk8VBPqoIaaCzPu8JZ4h
         R0dag0+GBHqO4UHv+OvqAqSo2vcdcL/qPq1Vpm79FjkdzWxYwbGgZOGOnFsUuxumzI6G
         xdQ2im57JfTnjee+2rsmZsnAEFdYdcAX9eEm7ytCYQWkxQqEJRDgfm3P4cDN4ZvKXSZn
         cUUg==
X-Forwarded-Encrypted: i=1; AFNElJ+Nf6ldggeUrWANXIz/96t3knGxoS1/bfKOqBXbw0gM5ZiyiOZUbjqNB6nNdZRWmyl7x67Opl31jETkWA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5H5OiAhzuwI0XX3iW755YhXPFEe0GyX+QBxIDZ/PON0Efk9AA
	veXO1iY044lpCwqFCmXkJmTKY774BLyzsBmOCsprPiO53N1n8xstcY9S
X-Gm-Gg: Acq92OHWXJ+5Z2a6f8i+/XssIbW+QL0vgXSwEMlDgBTTprqBCCfO7ysCh5+ysWNHcHY
	quGuzkf/LxM41b+7d4AhCX0ZWrX3CVYUdbkwECI33S/YU5/12OowTIOSQeKJ42C/SFDQPIxEn+z
	wuTBivX16OeocnjzgrHnWmSWwskAsv4oAk0t5myVc6z93rl4FbVJ0ESReT1dku+iCjCYdHxKT1F
	QyN6gI4e2g/E+/bOlpSa+17dBSCrqM2IKPwvy4MGvB/UksdkeYnVgdRXYmeN9BJ3L8WdojYdHGn
	IyDdHDnm23FRmf7kyrqCXXPEf8BLrA5ps0S1fktnVNdh/9P69QhGMBO2Q1DMl9Cg2D1RpQuRqxW
	jA/JM9NpsEkHFI6z9hfJ/l0pWzKkCBFBCs6Z8qPWNqJBXhx/Jse5FxmhklIThmIky9yZYIiNFLG
	8o1lZk7AZxl3UnpGIS/3LxbH8wShPB8kH2yuvVn6OXTFfH
X-Received: by 2002:a05:6000:984:b0:460:3234:293d with SMTP id ffacd0b85a97d-4606dbce8a5mr14655307f8f.40.1781446086390;
        Sun, 14 Jun 2026 07:08:06 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f450sm27152837f8f.10.2026.06.14.07.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 07:08:05 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Cc: samuel@sholland.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject:
 Re: [PATCH v2 7/8] dt-bindings: display: allwinner: Split H616 DE33 layer reg
 space
Date: Sun, 14 Jun 2026 16:08:04 +0200
Message-ID: <nIKN_benRn2Bk8SDZrkMCA@gmail.com>
In-Reply-To: <032c1099-40ab-470e-8cc3-af6d3cad22d4@kernel.org>
References:
 <20260509190015.79086-1-jernej.skrabec@siol.net>
 <ahNuuaVlDl0KvOSj@home.wens.tw>
 <032c1099-40ab-470e-8cc3-af6d3cad22d4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 25. maj 2026 ob 14:10:38 Srednjeevropski poletni =C4=8Das j=
e Krzysztof Kozlowski napisal(a):
> On 24/05/2026 23:33, Chen-Yu Tsai wrote:
> > Hi,
> >=20
> > (resent from new email)
> >=20
> > On Thu, May 14, 2026 at 2:04=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On Sat, May 09, 2026 at 09:00:14PM +0200, Jernej Skrabec wrote:
> >>> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> >>>
> >>> As it turns out, current H616 DE33 binding was written based on
> >>> incomplete understanding of DE33 design. Namely, planes are shared
> >>> resource and not tied to specific mixer, which was the case for previ=
ous
> >>> generations of Display Engine (DE3 and earlier).
> >>>
> >>> This means that current DE33 binding doesn't properly reflect HW and
> >>> using it would mean that second mixer (used for second display output)
> >>> can't be supported.
> >>>
> >>> Remove layer register space, which will be represented with additional
> >>> node, and replace it with phandle, which will point to that new, shar=
ed
> >>> node. That way, all mixers can share same layers.
> >>>
> >>> There is no user of this binding yet, so changes can be made safely,
> >>> without breaking any backward compatibility.
> >>
> >> There is user. git grep gives me:
> >> drivers/gpu/drm/sun4i/sun8i_mixer.c
> >>
> >> which means this is a released ABI. As I understood, the old code was
> >=20
> > We held off on merging the DT changes so that we could rework this.
> > I can't find the actual request though. It was probably over IRC.
> >=20
> >> working fine but just did not support all use cases. Why this cannot be
> >> kept backwards compatible?
> >=20
> > AFAIK the "planes" block is shared between two display mixers. As the
> > commit message explains, this prevents using the second mixer, since
> > only one of them can claim and map the register space. And on the H700
> > (which is the same die as the H616 discussed here but with more exposed
> > interfaces), there could actually be a use case for the second mixer.
>=20
> It explains why you want to make the changes but not why you cannot keep
> it backwards compatible.

I guess it can be backward compatible, but I don't think it makes sense.
Yes, original driver implemented original DT bindings, but there is no node
which uses that binding. If there is no user of that, why would driver
need to support it nevertheless? Supporting only actually used DT binding
allows for better code architecture, as there is no need to support second,
unused path. It also simplifies testing, since developer doesn't need to
test both paths if code is changed in that area.

Best regards,
Jernej

Best regards,
Jernej


