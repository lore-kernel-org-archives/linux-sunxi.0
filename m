Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB570629
	for <linux-sunxi@lists.linux.dev>; Thu, 11 May 2023 15:45:20 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-965e93f915aso1470660766b.2
        for <linux-sunxi@lists.linux.dev>; Thu, 11 May 2023 08:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683819919; x=1686411919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1xTtwDH0h6ZC1J+u5TGXBVnDx04bkJagkqS0GL4Cl9s=;
        b=HGke3Utl/C9TQvDOKgcVN/cyReg5F2qCx8t6WTH8Qc+hf7XbWQd35Qe5FwH0U09/dh
         jyFukCHufWfG2fn5a8bwTqWFmgNyzc4Pr4M+3g6CBmpK5rrn9kww4BVWEx5u2lkEqt6l
         6QWPYWVhavKoUtxJuUn2PfSM+oqJUSvHdzhV2pJ5hAJBpy/kaeGOQhau9sEOb6CHfVc9
         v6PaeKbgt6W3jvs3G3FL1w26svXavvy9mFa/iLO8fsL7nWhyEcTe/4S/D/C/07VFjvmb
         VO2ASpwK78Kmg3g79eMBzTI0TgtrfQ3xpqfv0wsFfK8aoi1CGaXxrmhzmRZIf9gUSmvO
         O54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683819919; x=1686411919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1xTtwDH0h6ZC1J+u5TGXBVnDx04bkJagkqS0GL4Cl9s=;
        b=ffTdMi6wuuu4jW5IQUtS1Yw9fUuYEikP+TZVrrmTApEGYBsts8pdIct0ek8V3aigAt
         jQ64Nvokdf4blhsHJzJc7TetLeyhxjf55i8rPNzM8szqYJ7amxKok96DNpXdt2FVh2BU
         +sMm10GFB+i5SLHxrg6w8f9KNSKLe6QasI81WUmsaqUW6f7NCUUKTp/5MX2WQXQnOTO7
         Zhzseyecv9vgggtIj4S+eJGbmpSD/LzB0HN0wFLyveDDjQfjJocW3IK1v7j/si1gu73b
         WVNUp5fnUNS0bGGt33CwzX4CtqMrGCkphSNNknILf+cyn1xln3dHvWQ6lw7xjOToCmQZ
         eRSg==
X-Gm-Message-State: AC+VfDygHErucjhcXeDWIrroSzRBPUSk2wmMlGcg2Xo8JKanqDbKJtz5
	qLFoB8+EBCdYEPH6QPDaoTE=
X-Google-Smtp-Source: ACHHUZ44Zq76h9r+t5vJCRO5BA4NUFEYuovdWgA8hUG9a9O4KSb/P1SHOMJQ02KV6TwLWdNFjrqPRA==
X-Received: by 2002:a17:907:3e1b:b0:967:3963:dab8 with SMTP id hp27-20020a1709073e1b00b009673963dab8mr14005143ejc.7.1683819919012;
        Thu, 11 May 2023 08:45:19 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id j17-20020a170906255100b0096a68648329sm900399ejb.214.2023.05.11.08.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 08:45:17 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Conor Dooley <conor+dt@kernel.org>,
 Jonathan McDowell <noodles@earth.li>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Subject:
 Re: [PATCH v2 4/5] ARM: dts: sun5i: Add port E pinmux settings for mmc2
Date: Thu, 11 May 2023 17:45:16 +0200
Message-ID: <8259835.NyiUUSuA9g@jernej-laptop>
In-Reply-To:
 <7949169f581cab37175602188f44bc26e79a45c0.1683719613.git.noodles@earth.li>
References:
 <cover.1681580558.git.noodles@earth.li>
 <cover.1683719613.git.noodles@earth.li>
 <7949169f581cab37175602188f44bc26e79a45c0.1683719613.git.noodles@earth.li>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sreda, 10. maj 2023 ob 14:02:02 CEST je Jonathan McDowell napisal(a):
> These alternate pins for mmc2 are brought out to the 40 pin U14 header
> on the C.H.I.P and can be used to add an external MMC device with a 4
> bit interface. See
> 
> https://byteporter.com/ntc-chip-micro-sd-slot/
> 
> for further details on how.
> 
> Signed-off-by: Jonathan McDowell <noodles@earth.li>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


