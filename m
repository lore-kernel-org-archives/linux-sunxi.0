Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAEC20E8
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Jun 2022 20:53:09 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id e2so14807460edv.3
        for <linux-sunxi@lists.linux.dev>; Mon, 27 Jun 2022 13:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2IA+0VfcVBkch2BU2eYjCNzBquhqaGbstP7Dzuv9Lqo=;
        b=TUVg0HsIqLw4sApAkHjqnkpFHrds7l7w0mQZVXGCjUxtRg9tT/C0Sbb8yO+tjzsYSY
         kj6NfSMrW3R9plL5lGlW+mcCCb7SdvQBZo1fRAPrxIlm3LY8ws+enJl7Q2gFbOvlbY/A
         CZc3kQz7BKYdmhONPxVB8QxIoCs9TLFW1ezxIvteEDCrpx6Y5jE4M5IYLfzQ4p1LFTFB
         pIMAstdeQ8N7xmpOKec/0SxjfkcK6F2erW4jmyBQv9T/L1OtyWymKO5tOG38e17cUtt4
         kX7XcNInyC+5oa262lczEiqFMnYEi/YggipKpwgcx6zUS4dmWa4w/09RAh56/EjB9lzv
         VWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2IA+0VfcVBkch2BU2eYjCNzBquhqaGbstP7Dzuv9Lqo=;
        b=BNTCCFjGnx6qolbXR/tGFV6sasBQwZpXM3j+XYpL+lycHwWcHUumTAqPNwpc7md9yR
         hctqLhGtVXe9+B8THUrLvflpfsc8+VFaNbnIADFzUELgVF1Ds+VdUIvHuYZpE5XxlZVE
         oOVVnaZhwsV3CWhatt+Tnssu+ETunqWKSdSUHtLbWGlPr0bC56MWV8n5lHP5aBS3nj7i
         y15ee3hLvmtHNN0FSZrHnnws3xbYH0hD40I5QH/myH69diWqBK4Vnbar7s3bJ90Wob1S
         DdW/WlVqOh/D0+jZMfYxYTwFanlUQICSvit1F5IuxfkPOk94WNVtpOJ3aoX2tmZfNbeq
         xxqA==
X-Gm-Message-State: AJIora+fjGzdxaXLlPhmydcRSJ8xjPbxtwtTniY+EU8ZZAkKKrO0ItKx
	PJgmvnTt+sXV7JZkY776ges=
X-Google-Smtp-Source: AGRyM1sOleAAXiC2Z84z7E23pKGNaf1YN5XBERpRmtfSGUqMPsciG8VWq+vn/Gj8YZVQHS579GHYiA==
X-Received: by 2002:a05:6402:14c4:b0:435:717a:fd63 with SMTP id f4-20020a05640214c400b00435717afd63mr18902564edx.395.1656363188396;
        Mon, 27 Jun 2022 13:53:08 -0700 (PDT)
Received: from jernej-laptop.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id r1-20020a17090638c100b007219c20dcd8sm5447202ejd.196.2022.06.27.13.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 13:53:07 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: Arnaud Ferraris <arnaud.ferraris@collabora.com>, Samuel Holland <samuel@sholland.org>, Jaroslav Kysela <perex@perex.cz>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: pinephone: Enable internal HMIC bias
Date: Mon, 27 Jun 2022 22:53:05 +0200
Message-ID: <13043007.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20220621035452.60272-4-samuel@sholland.org>
References: <20220621035452.60272-1-samuel@sholland.org> <20220621035452.60272-4-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 21. junij 2022 ob 05:54:52 CEST je Samuel Holland napisal(a):
> Revisions 1.0 and 1.1 of the PinePhone mainboard do not have an external
> resistor connecting HBIAS to MIC2P. Enable the internal resistor to
> provide the necessary headeset microphone bias.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


