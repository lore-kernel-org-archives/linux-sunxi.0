Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DF22917
	for <linux-sunxi@lists.linux.dev>; Tue,  5 Jul 2022 19:53:59 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id y8so10896169eda.3
        for <linux-sunxi@lists.linux.dev>; Tue, 05 Jul 2022 12:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oXMuNwTXUvJo0+POZWc/5imaFRdw3zoRSiX+En9QOVw=;
        b=aCAO7obABtqBdXKJyThLKOxRy3Gkos3sCS85KBPppcd5OtU6W0mAv8wa3910L4g+wv
         fVzmu9c7Lx8j8FyLigZXQNdR2GQHgxpkhaEKzuYcF0X4V3PODju071tD4JP/R8cA5Rzx
         1w1//jejTVMZPH0Tj8JKWbCQ79VtMdgFKuWY86K7kkCZC6/DZMdfPlz1/b8wzw+9I6gi
         Wy8c9PFMCRb3qBkqpLtc/qt87+Sdz+eRCVxRqrDay6SUsCmLAPmMBtKGiMzFdl7COXLj
         cFeEZpcOIyfO4THHHDc2kD1wA0y2IGoVRMAuFGiD2bTw9Evr8M9iSafyZJ4IDAimmgME
         PAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oXMuNwTXUvJo0+POZWc/5imaFRdw3zoRSiX+En9QOVw=;
        b=fpZQ7fqGteF3duXDSxVtmUmv1gWCGKKt2lpkA0h2yiihqGOJhcwL6lQe63zzFiz9vR
         NIpFogm+OVinDe+lKOrG/37K5sk2wiYTSgRexS5oH9Rb9gEvBci/gDpD8wgMmkv5P8M+
         pvJDYhXpWGv9fKQMvxZcSuZr09uRgP2lMGRPT9vp+ZwL3yp1rVEcy5jKCvc8FoZBSzzS
         H7mj9JUHrGUR4qzGgeIqQqt5Ufyro2GPX8QD5OG4QYix2dtYyWMWU16L+GWYEMW048Qu
         eXMtL/FPnCheXcrNwmByKGKF0YntfQpXQW0QD/9cLzhXIKQvVTlNKNyobJYXj0JJFf5O
         Hvhg==
X-Gm-Message-State: AJIora93vsUjOIVM5myZxZFNbSLKIXJHd+P60Payp5VQXOQzb6sy1dLf
	OGk+X4yA0ymHHRt8Sl6t4O8=
X-Google-Smtp-Source: AGRyM1tkSzZ6D5ILvqab8zXo3yg+wHUqQ7K5bD/agyl++p9ronNEmGXjzgYTHCP0hrx20V7g2KJ6Cw==
X-Received: by 2002:a05:6402:228f:b0:43a:896:e4f0 with SMTP id cw15-20020a056402228f00b0043a0896e4f0mr23879935edb.81.1657050837497;
        Tue, 05 Jul 2022 12:53:57 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id a18-20020a50ff12000000b0043789187c1esm18863714edu.80.2022.07.05.12.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 12:53:57 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-usb@vger.kernel.org
Subject: Re: Re: [PATCH 0/3] dt-bindings: usb: Document Allwinner D1 compatibles
Date: Tue, 05 Jul 2022 21:53:55 +0200
Message-ID: <1688790.QkHrqEjB74@kista>
In-Reply-To: <44784082.fMDQidcC6G@kista>
References: <20220702195249.54160-1-samuel@sholland.org> <44784082.fMDQidcC6G@kista>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne ponedeljek, 04. julij 2022 ob 22:35:24 CEST je Jernej =C5=A0krabec napi=
sal(a):
> Dne sobota, 02. julij 2022 ob 21:52:46 CEST je Samuel Holland napisal(a):
> > These patches document the compatible strings for the USB controllers in
> > the Allwinner D1 SoC, which require no special driver support.
> >=20
> > Samuel Holland (3):
> >   dt-bindings: usb: sunxi-musb: Add Allwinner D1 compatible
> >   dt-bindings: usb: generic-ehci: Add Allwinner D1 compatible
> >   dt-bindings: usb: generic-ohci: Add Allwinner D1 compatible
>=20
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Applied all three, thanks!
=20
Best regards,
Jernej
=20
> >  .../devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml        | 1 +
> >  Documentation/devicetree/bindings/usb/generic-ehci.yaml          | 1 +
> >  Documentation/devicetree/bindings/usb/generic-ohci.yaml          | 1 +
> >  3 files changed, 3 insertions(+)
> >=20
> > --
> > 2.35.1


