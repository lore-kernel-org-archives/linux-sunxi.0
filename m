Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BD48AD0
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Nov 2022 21:31:14 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id f27so39475616eje.1
        for <linux-sunxi@lists.linux.dev>; Tue, 15 Nov 2022 13:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NuwEA1//rEiZ9SIXSxB8K40zOCZHlQgw0PCBzNeNQ5I=;
        b=Ru5f3SLgubKJgLZYHgjKReHhixWrPdDLR8c8evvgt4Z1sbvPov+bBOAPjYv6wOmEGC
         wuh24SD/zUTThaqS11cikEg2hiMhtnB4UjWZYBHuKLQGXVaXWY5/MwN+ogAErLxjDLY7
         F2ZOvz3jMuMjBJw+Rh78sGgZMSLrHnFrsBS5nDdhsay1PzDXpH6kB2Vvpd75uVoqg0mV
         n2IgvaM/WXp+UDgByrC98g5133XF8OymuuKNNhBMcnngJqt0zBF7Xs475NIY4PUA2jPm
         X+mzskMa/eXmWbsZ50gTBAJvaxhBpOt3gv65x3+255U0NdSccgybH3yXK88HHUuwHnYT
         4M9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NuwEA1//rEiZ9SIXSxB8K40zOCZHlQgw0PCBzNeNQ5I=;
        b=kMipHAPLvY8B2FdBJX9kHvDy9Mx9SRn1KOmr1F8yoRDGg0XE9XQdJkoe0iIMdQ0HRv
         egqBzk+603PSx0wwB0h4imF6zQl22ihqyJsxSBXY+UIHpKeC8ORxzBEdn1Fsg1/0uuCc
         qNjKOmEBOCTBhiR2Mts5zkGtEZRwlCk/nkYAy7S//1Q98Yg4xoAwTjy9jyrv7hC0CsBk
         98HNOkfazb9lsSEjraIRy2YSxDPzN6tYKFCKr6jj412fAxiYKl9j7WW6gGlMzYynvqyK
         Obxpu8AGAXosbzBYwBawxMgjryGfZlDM25A5Wf98gnMOgZyU1sKS+Sefu13olj7CqvT0
         bASQ==
X-Gm-Message-State: ANoB5pmHmkURXsaYiZ+bocBQfq8s/fQpUN5NNKA8pTno/AGZw9EB4EO6
	bnSDf8YVbGo0n5OB6HSqq5g=
X-Google-Smtp-Source: AA0mqf5Zm31QFNT3PlLIzS3hN87Qrr0tlkvKMCRdGyCCwKnm2IkLh3/dCPdFhvSBQco74JxUmX8diQ==
X-Received: by 2002:a17:906:2ecf:b0:778:f9b6:6fc with SMTP id s15-20020a1709062ecf00b00778f9b606fcmr15866641eji.580.1668547872425;
        Tue, 15 Nov 2022 13:31:12 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id w14-20020a50fa8e000000b00461bb7e7ef1sm6692823edr.30.2022.11.15.13.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 13:31:12 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Samuel Holland <samuel@sholland.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h6: Add IOMMU reference to Hantro G2
Date: Tue, 15 Nov 2022 22:31:10 +0100
Message-ID: <2853225.e9J7NaK4W3@jernej-laptop>
In-Reply-To: <20221115090644.3602573-3-wenst@chromium.org>
References: <20221115090644.3602573-1-wenst@chromium.org> <20221115090644.3602573-3-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 15. november 2022 ob 10:06:44 CET je Chen-Yu Tsai napisal(a):
> The Hantro G2 video decoder block sits behind the IOMMU. Without a
> reference for the system to properly configure the IOMMU, it will fault
> and cause the video decoder to fail.
> 
> Add a proper reference to the IOMMU port. The master ID is taken from
> the IOMMU fault error message on Linux, and the number seems to match
> the order in the user manual's IOMMU diagram.
> 
> Fixes: 0baddea60e8d ("arm64: dts: allwinner: h6: Add Hantro G2 node")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


