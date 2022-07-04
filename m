Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA0B17DD
	for <linux-sunxi@lists.linux.dev>; Mon,  4 Jul 2022 20:35:27 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id dn9so13126821ejc.7
        for <linux-sunxi@lists.linux.dev>; Mon, 04 Jul 2022 13:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l5RKSEwMtYWUzRQ7RcuOICxLgoH1DtWLQtcUXxCeKHo=;
        b=cuuhrnB1Z3qMtW1Rte2htfl1jyJZuMjDt6eYBMPcdlfZO6h5Tk8lzSNU8TBINmyjsE
         WIzVD9Q85f4Px1O2uq1wtus48tCNFG/Ms1UhxQy8t0DlGfAMWDZoiaPUq7rnFXDUY3xp
         MvwP5fqRA9eM6JBwK+OoW0pBx8oZld6jdyBB76Jh2QhLA1+MAqRvPap4xS8m86+i0wyz
         VLcmkO3GMq9j74GW6fA1JKneoJ7Cr0+II+Gsx01355O/wosjGmVQXe6ilukT8XbIPSQH
         gzbTlNAE+f5Nijsrz5830jxhRHYaUVvLn3uq50HqUQDDBwFcQO9c2sUTlJyP6YGo6xPZ
         nejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l5RKSEwMtYWUzRQ7RcuOICxLgoH1DtWLQtcUXxCeKHo=;
        b=sFyTxJPeFnkS3rHOALc9Yvr+mzHHZAeiqyKeKStlIjIJQFEFmH+aqqN6zgr7pJIuHl
         tJmu5qcvRmzxJi7WZ/xSyBFoW2Lp0MG6qh4tyH21PjlVKEVGinsJ1fTcWKMUjQAUHzJ4
         az0ZqhhwOky0OVYIEJPSfhiEMOJ1K5ChlctVc4lrOPosoBN0t4JS6vxXTEGiwx7sjzEC
         fjWiqBwTQR6KHq41iNVDYZmTKjWwoZLkaaN/KZcFjX2gMtXwvb9rJ7pkBu2ySIKshqYs
         iOVZ473jnXa9woxEhNyOupdPdvxldaAQV0QFS984ZP0jW7XJbIylTAayTpbQX2U/Jpmr
         4ANQ==
X-Gm-Message-State: AJIora9bnaVB/gfV4g6pXlHLrDrhYfsFD41c7P4BHHfHMhlol8d2xR4l
	TsKLfdiNGN++s5Vgu1nMn/A=
X-Google-Smtp-Source: AGRyM1tlNsZvI5Qs15Ak98v/bYen0FnGftmRy+1cPsXpKDmi6R1EGXR3Z5hY5U8PyRS+UxnPErWYMQ==
X-Received: by 2002:a17:906:d550:b0:723:5c2c:8a71 with SMTP id cr16-20020a170906d55000b007235c2c8a71mr29789718ejc.254.1656966925403;
        Mon, 04 Jul 2022 13:35:25 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id uz12-20020a170907118c00b00711aed17047sm14599009ejb.28.2022.07.04.13.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 13:35:25 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/3] dt-bindings: usb: Document Allwinner D1 compatibles
Date: Mon, 04 Jul 2022 22:35:24 +0200
Message-ID: <44784082.fMDQidcC6G@kista>
In-Reply-To: <20220702195249.54160-1-samuel@sholland.org>
References: <20220702195249.54160-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 02. julij 2022 ob 21:52:46 CEST je Samuel Holland napisal(a):
> These patches document the compatible strings for the USB controllers in
> the Allwinner D1 SoC, which require no special driver support.
> 
> 
> Samuel Holland (3):
>   dt-bindings: usb: sunxi-musb: Add Allwinner D1 compatible
>   dt-bindings: usb: generic-ehci: Add Allwinner D1 compatible
>   dt-bindings: usb: generic-ohci: Add Allwinner D1 compatible

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> 
>  .../devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml        | 1 +
>  Documentation/devicetree/bindings/usb/generic-ehci.yaml          | 1 +
>  Documentation/devicetree/bindings/usb/generic-ohci.yaml          | 1 +
>  3 files changed, 3 insertions(+)
> 
> --
> 2.35.1


