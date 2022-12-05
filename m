Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0FD7C
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Dec 2022 20:42:05 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id n20so1502996ejh.0
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Dec 2022 12:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWNOm6qDMo1xXbSWez6F0Vr3ScX8LNHNqSo7KMJ1CZg=;
        b=WcyOKlKhgWRKmKCex9KlNc4vfbJR7H9xX1lhfVBHgrnjX9BxyDol24Beb/sw3+wrfl
         mcq+5f+42JfTTsKBIN+3/X7aXUJfdCdsi3t/AOgpNk5McBsN9bAqOMaSo6+UnShYLzof
         XEvPKBEPeYVl2RAHjS/TSCKSPoE6+N7IXSKVeNdWvsaPiIwAcCidfuYmpjgUlmMgq8ua
         JC+0lKYH9TLCiiBBFlEC9vYU5DPQcvVms7Z1Mq+7xZZBhko9icQUHK/XLhjNfS36BGzT
         9NpapC09/jdDbzgE2b3elsxEWUFveTv+GgE/W02C6nxz8cFP4E0zfq6K3FuFHvngzk2F
         ZAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWNOm6qDMo1xXbSWez6F0Vr3ScX8LNHNqSo7KMJ1CZg=;
        b=fuwqb73wm6iQOnN+IxHhgP5ZVVdLkCdnMXPuUPb0h/gJlUs2uREL9fjFc235zhnq1U
         3xgIHH4oY01kEowaXBGWeNbf7wktdDLJtCJ/2VmWUv3FLPd3QZ62QQXMqDRqf25o3GmH
         Jwog3j8TM/SrAAINvmS5ptTudi0LzWtpY0nV8u/aflawavEwPONY1eD1xWMHpQHvQaK8
         7/bbXFOXWeOo75fzO+iwbGPh3mJS4DTfnTEchDConr/xkSZ0hygxd3syP5Sd+3T2bHZj
         KLbnbLYP8yWOk14oByTQVcKMZKhL/oHX9efNIGuU1dsHIOsMvJet5Kb5GR7K3BV/T7jE
         1TbQ==
X-Gm-Message-State: ANoB5pnzBJ7dylfEgOXAhje+wQLgjziJCNsMuqLw8eZu5RAskg94nhW8
	PEeJjIbcmVFRu4/6yobyo0s=
X-Google-Smtp-Source: AA0mqf5rroUoM42vHCkdHZZd5l3XiigQTzlVKoW/izJnAPaZeqagB11YRTTqF98uLV6H4yaznZoCtg==
X-Received: by 2002:a17:907:770b:b0:7c1:277:caf3 with SMTP id kw11-20020a170907770b00b007c10277caf3mr2397713ejc.247.1670272923966;
        Mon, 05 Dec 2022 12:42:03 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id 6-20020a170906310600b00738795e7d9bsm6582019ejx.2.2022.12.05.12.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 12:42:03 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jisheng Zhang <jszhang@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Samuel Holland <samuel@sholland.org>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, Christian Hewitt <christianshewitt@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Linus Walleij <linus.walleij@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Stanislav Jakubek <stano.jakubek@gmail.com>
Subject: Re: [PATCH v2 07/12] riscv: dts: allwinner: Add Sipeed Lichee RV devicetrees
Date: Mon, 05 Dec 2022 21:42:02 +0100
Message-ID: <3466608.iIbC2pHGDl@kista>
In-Reply-To: <20221125234656.47306-8-samuel@sholland.org>
References: <20221125234656.47306-1-samuel@sholland.org> <20221125234656.47306-8-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 26. november 2022 ob 00:46:51 CET je Samuel Holland napisal(a):
> Sipeed manufactures a "Lichee RV" system-on-module, which provides a
> minimal working system on its own, as well as a few carrier boards. The
> "Dock" board provides audio, USB, and WiFi. The "86 Panel" additionally
> provides 100M Ethernet and a built-in display panel.
> 
> The 86 Panel repurposes the USB ID and VBUS detection GPIOs for its RGB
> panel interface, since the USB OTG port is inaccessible inside the case.
> 
> Co-developed-by: Jisheng Zhang <jszhang@kernel.org>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


