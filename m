Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5ED07A
	for <linux-sunxi@lists.linux.dev>; Mon, 13 Jun 2022 20:53:09 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id h23so13343917ejj.12
        for <linux-sunxi@lists.linux.dev>; Mon, 13 Jun 2022 13:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0xKpA2CkarcNm8NsicwZmWQkXSJdlfuX89TYCY5IOVo=;
        b=oqcBeVuuOMRJM412U3KFCHQa2M87fcxpRnxTqck08gJQDouywpryfANrktU2bzTpFl
         fsd1PpSOY3yl1qhqTmYGgpebhL0fZQk5JejqxS4kHZJPGxXieBsaGZgWRYC8IkhYJqZh
         ueGwr+q0B7dEVqMyenU1G8A3iOt7yHSiRqN1gKyA6OySiWaxwsgiKg4xobRn2m2xgN9L
         PF1cdR1mlZyG0pNLiDxgUQHDpgxWuY1TcsM5HWYgAXIKM34kElxXrTKcOd94PT5IMdd5
         PXBxlmbyTMjE1mQOwAw3YJIKodTKz5uLmBLvnaVTXDoPzwJh3RnHoqVInxNL4eyJBJZd
         EgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0xKpA2CkarcNm8NsicwZmWQkXSJdlfuX89TYCY5IOVo=;
        b=6qo39ZtcFgQS7HWaI/fFUvRWBGwf18okXpPZcR4iOzrLNxP66fYVYZBJhEKzbFxeq0
         6s5109sGtTelslNq4vj70WouOM7xwW9HfYwOSfkYWgDJaQyssalcsdtzmCQ7DPsZWPzA
         ljMAZljeNdSe7j1oFmETJ3hUI1VEHKZBXtln6KTBu82Z4IuffK6ll7V4Ne9pgd9srlTr
         hNVVh38JQgdh9a9i/Za7omJRI9NqLxWOoDW31zf7MX8unpYbET6xxhv/x4j4Tu9l6mfE
         ChTWD7NB08LN1bZ0uAM+v7dG9Rv2FGQBplqC/eurwwApSQ+W9QgdgX9xL4Kw0utm1Ttx
         i9Ow==
X-Gm-Message-State: AOAM531YAiNZ3Yk6NYQMUDc2j0SRJ6I6jOemUCvweKHQYDanIuIZxmFc
	Mlm3XpATG61pZdqfJGGQWVg=
X-Google-Smtp-Source: ABdhPJwfkzRmgw0YzkxGU9voWfn/nUs7UdNN6/bLuU+oxejU3G6rzltetr68M0tPwtfEuI1tzCNTQw==
X-Received: by 2002:a17:906:a383:b0:6f5:132c:1a14 with SMTP id k3-20020a170906a38300b006f5132c1a14mr1410151ejz.21.1655153587911;
        Mon, 13 Jun 2022 13:53:07 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id gl6-20020a170906e0c600b006fec63e564bsm4224434ejb.30.2022.06.13.13.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 13:53:07 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: Re: [PATCH 1/2] ARM: dts: sunxi: Use constants for RTC clock indexes
Date: Mon, 13 Jun 2022 22:53:06 +0200
Message-ID: <2632539.mvXUDI8C0e@kista>
In-Reply-To: <5831557.lOV4Wx5bFT@kista>
References: <20220607012438.18183-1-samuel@sholland.org> <5831557.lOV4Wx5bFT@kista>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne nedelja, 12. junij 2022 ob 22:45:47 CEST je Jernej =C5=A0krabec napisal=
(a):
> Dne torek, 07. junij 2022 ob 03:24:37 CEST je Samuel Holland napisal(a):
> > The binding header provides descriptive names for the RTC clock indexes,
> > since the indexes were arbitrarily chosen by the binding, not by the
> > hardware. Let's use the names, so the meaning is clearer.
> >=20
> > Signed-off-by: Samuel Holland <samuel@sholland.org>
>=20
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Applied both, thanks!

Best regards,
Jernej



