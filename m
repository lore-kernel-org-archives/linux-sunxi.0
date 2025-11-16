Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1CC2367BA
	for <linux-sunxi@lists.linux.dev>; Sun, 16 Nov 2025 12:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763295041; cv=none; b=WWe+h2jSy8QUVWXxIFRB0MWoKTpeUaXA6w0B/0CiIOxZ8wPFHh7iigCSj46D++YBOLhvTN8fVV10mvZqhRUqtRyZyvMoeUe13w1bQ0FBVLc9/uLkl+BTT0bbBS8JMd3Bhkmrhiug/ibgKvBtMJze2V4SBiueZoxODnKiQBz4obg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763295041; c=relaxed/simple;
	bh=Cm+2lfk8XlHB46YTwhqwQK4u+14C2DUuWYsaApKyO9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JPQvqXsK9hnRAT9H7S3BDlywFbpWM6fLQr26ijKGp0COy4WeVTM2ZgbDnBYxa3V37Q0DXQeGFjvh2qrYOWOjAk1qloCXJBmSH+ByC/a/XMjN5fVx1JcpHsp+EPK0chcXr4O1vp3Gr8RV8kNeW3QnRVt5jlvqX6vhqMXZRAIHm+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LytjGFye; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LytjGFye"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-640d0ec9651so5686819a12.3
        for <linux-sunxi@lists.linux.dev>; Sun, 16 Nov 2025 04:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763295038; x=1763899838; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BnsF6JeZIC4Q2fWv2jeLUTcHN7i4Xl69LvES25j5B6Y=;
        b=LytjGFyezM0IXn1TlEV3XAkazRBeCEB9mMbWDU18lpnXgRxkgGfDdOEW0pwIXjLb04
         +6k1NXcGd6F4qiVaM4qN5ztShSFwfUbUyW3FE8GeJge5QnFoc5Ug7Q5o7EofEKuM0b2G
         KJiTkKFOmZJ0uoUVtrdM+XA/7/Zar77MqUlMGa8uw8Q4amqAGrWjBlHHUbTV+YJNVd99
         Qgcs4aIH6Y8l1O5fQcd8f45P2KvQkQgL2QegSGvp+7vgovNS0QLuqHI6xTNc/a5I6V1j
         13dGSn0xlDsVBIJhCvhCvmco+tLmegl5doKMClpT3yRc6KO4u41Rg+IaPkFdzmMdpKJU
         dMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763295038; x=1763899838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BnsF6JeZIC4Q2fWv2jeLUTcHN7i4Xl69LvES25j5B6Y=;
        b=VG8NuWWRUc+aL9bcu72t3dj5wwRLakKLuW0WDhXhf7l3LoKyK5FnpHIBdvu9/lXMos
         JsrtSj/9U2b/kNUyl8Bae9Ic6ZRn0omVNzkbIwmxOySOG2cSUzXan3+oILWaqRUYVZ6c
         n6QbnMPnU+BjBQ9+4EjPwix4cXzFFCkpI5MMs3r+aawdbBqRy/79UVBrSpl8o8l7YynQ
         I488KIFJM/yERycfndeofnrBwFtMjQuqCUBf92moz5f0MiqT6LSvEVYJ5AOjovLrgl7V
         iKDfOLQgJynDA2X1mLMRrY8TwspnJVzg0TFY0z6zuFVpNSi6mfpakciKUc52IY98ZypA
         9FpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVj64ZW00Zcv9xfSjrx6Sf+YskQ8F5paUVbh5fmeCJwBcwf26Jny559hiLSQn9WqY+Fqk/JEnnp8WyI0A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzJnv1L4WABBcz9pMXIfTmwdg76chgiof/622JYpfU9HQ+BxEPj
	SSGOupiKJ4pfIyn6sJgzqVXFjsFTE3/PegpGsTNV9mVjojmbCXBEG6PZ
X-Gm-Gg: ASbGncukwszPrFpQhD25U5Tkk4PJV7t7wM4aKT2R5ZZM7IjAPmFBQzG8pW2xeyfwzgN
	+QyjReWQ6vfux+nwOi8T74O2VEL7BpBTRpekSR9uRjqtFnoBb4dhnUHW2YjOh62CsgfU6RQ+065
	BmSo9kWxHvq8e8eyNBVie/7WYkpBUudaH5pggsxjnGdgEq2ubgGwL2YU4JA2JPHpPcdleaupoOs
	aTyUi0m7GD6H9sePDTeGNYHWmK7Jvs6Py9GOiZ4JJJxH7LW/qd7fhLdJ2Awp+1epo917U1dm5zL
	+gw/QHayu5TME9RYGZUSKL7yYLGlw/TGo7BnXZRMGCAJPyRISYMYGKPOrWC/VM2ENcqhlpt75I8
	dkPYUAIfAAjY/VKDxFEKkmYC3hDz/AJv/EBTbtMZoNm4dr85CLnTVh4Olon/5jR/ipJrJ6VOuwZ
	VdLMmGNfbWwErQenz/CQD61wr6DsjWOC3g20zU37T4QLj0vQuOYzabWGQnRw==
X-Google-Smtp-Source: AGHT+IG5Pb4oZTy+N/ijhNzo5h6b+rv9IQmhgKS6Icb7AJg8wd0rdoZ0YkfWkZADk7dGg/KIAneikA==
X-Received: by 2002:a05:6402:5112:b0:641:9aac:e4bd with SMTP id 4fb4d7f45d1cf-64350e9ed21mr8531044a12.26.1763295037690;
        Sun, 16 Nov 2025 04:10:37 -0800 (PST)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4b1fadsm8008375a12.31.2025.11.16.04.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 04:10:37 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: wens@csie.org, samuel@sholland.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 4/7] dt-bindings: display: allwinner: Add DE33 planes
Date: Sun, 16 Nov 2025 13:10:35 +0100
Message-ID: <3659815.iIbC2pHGDl@jernej-laptop>
In-Reply-To: <f8979d59-0f71-438f-92ec-bf1077279dce@kernel.org>
References:
 <20251115141347.13087-1-jernej.skrabec@gmail.com>
 <4691137.LvFx2qVVIh@jernej-laptop>
 <f8979d59-0f71-438f-92ec-bf1077279dce@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 16. november 2025 ob 12:49:45 Srednjeevropski standardni =C4=
=8Das je Krzysztof Kozlowski napisal(a):
> On 16/11/2025 12:44, Jernej =C5=A0krabec wrote:
> > Hi!
> >=20
> > Dne nedelja, 16. november 2025 ob 12:29:27 Srednjeevropski standardni =
=C4=8Das je Krzysztof Kozlowski napisal(a):
> >> On Sat, Nov 15, 2025 at 03:13:44PM +0100, Jernej Skrabec wrote:
> >>> Allwinner Display Engine 3.3 contains planes, which are shared resour=
ces
> >>> between all mixers present in SoC. They can be assigned to specific
> >>> mixer by using registers which reside in display clocks MMIO.
> >>>
> >>> Add a binding for them.
> >>>
> >>> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> >>> ---
> >>>  .../allwinner,sun50i-h616-de33-planes.yaml    | 44 +++++++++++++++++=
++
> >>>  1 file changed, 44 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/display/allwinn=
er,sun50i-h616-de33-planes.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun5=
0i-h616-de33-planes.yaml b/Documentation/devicetree/bindings/display/allwin=
ner,sun50i-h616-de33-planes.yaml
> >>> new file mode 100644
> >>> index 000000000000..801e5068a6b5
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616=
=2Dde33-planes.yaml
> >>> @@ -0,0 +1,44 @@
> >>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/display/allwinner,sun50i-h616-de3=
3-planes.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Allwinner H616 Display Engine 3.3 planes
> >>> +
> >>> +maintainers:
> >>> +  - Jernej Skrabec <jernej.skrabec@gmail.com>
> >>> +
> >>> +description: |
> >>
> >> Do not need '|' unless you need to preserve formatting.
> >>
> >>> +  Display Engine 3.3 planes are independent of mixers, contrary to
> >>> +  previous generations of Display Engine. Planes can be assigned to
> >>> +  mixers independently and even dynamically during runtime.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    enum:
> >>> +      - allwinner,sun50i-h616-de33-planes
> >>> +
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +
> >>> +  allwinner,plane-mapping:
> >>> +    $ref: /schemas/types.yaml#/definitions/phandle
> >>> +    description: Phandle of Display Engine clock node
> >>
> >> You description is almost duplicating property name. You need to expla=
in
> >> here how this device uses them.
> >=20
> > So I guess I can copy commit description here? It is needed to
> > access registers from different core, so it can assign (map)
> > planes between mixers at runtime.
>=20
>=20
> "to assign (map) planes between mixers." is enough.
>=20
> But it looks unfortunately like a spaghetti.
>=20
> Your mixer binding references via phandle this planes. These planes
> reference via phandle some other region to configure planes between mixer=
s.
>=20
> Isn't this the job of this device?

It is a bit confusing, yes. There is no clean split in register space
for some functionality. Register space for this node on H616 SoC
represents 6 planes (each plane consist of framebuffer management, CSC
unit, scaler, etc.) but not actual registers which tell to which mixer
they are currently assigned.

Best regards,
Jernej


