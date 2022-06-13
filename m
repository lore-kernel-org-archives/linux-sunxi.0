Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDB17A
	for <linux-sunxi@lists.linux.dev>; Mon, 13 Jun 2022 21:00:05 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id h23so13370171ejj.12
        for <linux-sunxi@lists.linux.dev>; Mon, 13 Jun 2022 14:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9CJMCg82C9CA+VF6EtDbiVLWnCE+gcyYEDGZtnWDX8I=;
        b=cJc/SprZOfokSgWwnzvuGuRwPp1zab3QO7Q9DUSxb6DYSiH8EGH3aR8DOm3dcA9B7l
         GjDO0NbkAF2WQW/sB26wXSNDG/PQsezHS9Sy3haCeZizj7fwKU12mhzRtLLFDmEiu/hp
         dlHvkvfXMG7Fl99OAPbv0f+ufocMcSZyjnoKeqK341x16Cgcv1X9zl7i5AP9aThKe9bY
         IZMJYxoTArAncCcTCMjPw5JyRmrVUAQizo6neNGAPII7SBuHvcAvwtjxvW6e3mhPQLrT
         dpZI1OZO3WsL9PmsWGp3FGnrSd4NyGXdmNxtFsfVL37/QmqoEv8E9IxiwBvVS/IrPskC
         WxoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9CJMCg82C9CA+VF6EtDbiVLWnCE+gcyYEDGZtnWDX8I=;
        b=JcXZibHKY+YDK8mmwovr1xT/L/2SQThd6z7r+woyu58eaZQ9bAe5cqFk4V2RVSTmBZ
         u+XRU+igHrT1JwViSe1slKdkkFN0O0C5RILJuOL0+HRAD5IN211Xr+v0GpHqmM/RNPGm
         S06dEScCL9xiw+w8MbV1jkXF+CX5XZFY5kpY54yrV9LrgRbVHzbd7sm3FkVox5ISn5Ie
         Q7vnwaTOj1vzNsoX1hCtgQ+oZDTeoojNjhryN+ljisOLEewpo7kjImJtXoW5M7l0L+hx
         HHizFuDBMk6uXqzvzHjZsAAhCJCfLwiUS/r8dE3G7K6s6yAYRTqWsdcJfzXVUM2M5cdj
         AGzg==
X-Gm-Message-State: AJIora8Cjcju4jHJ8OpJjHKphLpLtmpntOL07bDN81QQZ/2EMsdYzAL2
	G0pA5Q7ZxKN9TP8fOvX4uh4=
X-Google-Smtp-Source: ABdhPJy/yfR5haJgk6lB/FbMqG7w8FPgqDK3la1oweXRWZE+kcsnyfKXjsR13vgEm01lVEVNEX/dFA==
X-Received: by 2002:a17:906:7a13:b0:711:ff9c:f4bb with SMTP id d19-20020a1709067a1300b00711ff9cf4bbmr1415216ejo.642.1655154004124;
        Mon, 13 Jun 2022 14:00:04 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id h18-20020a05640250d200b0042e15364d14sm5671325edb.8.2022.06.13.14.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 14:00:03 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, arm@kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 05/48] arm64: dts: allwinner: align gpio-key node names with dtschema
Date: Mon, 13 Jun 2022 23:00:02 +0200
Message-ID: <5574044.DvuYhMxLoT@kista>
In-Reply-To: <20220609113911.380368-4-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org> <20220609113911.380368-4-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 09. junij 2022 ob 13:39:07 CEST je Krzysztof Kozlowski=20
napisal(a):
> The node names should be generic and DT schema expects certain pattern
> (e.g. with key/button/switch).
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


