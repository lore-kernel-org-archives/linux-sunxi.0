Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590AF33D4
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Aug 2023 11:57:32 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9923833737eso497617766b.3
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Aug 2023 04:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691323050; x=1691927850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqoxJy61U5ChrDZNF8qDxNxWhT9NIH9OWQGAhIzhydw=;
        b=bAeErR5z+KL6iDu4vHfBWAeoBNY0HhNpgLr6W9016/m1/Q7u4m0mEVyOUj6cAFuy8N
         BXJVNiU5X6T7KpJW+KPH5zGOClem8PBlkYYpR4I0w1vPtHD4ep6n65iet4384FJntcl0
         MaOlgZ/4U2PjNwE3GMFNZR7vvRqafap+H9LK02G3g1VyAD0kVM29JZXdiNbxt8DRz6cd
         mLUEsBysA0Nl+pbOx9PIHtY8XzOIwNeFqxKarF7qs1xgMhz712SeJm3SF4XPgxz91wAf
         8BsSoJLDnvIM/dxhpbwG+yQzNFYk82JAjW8UscirG4qq7s1erGcj0/3RqPT4WFWPlj7I
         sAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691323050; x=1691927850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GqoxJy61U5ChrDZNF8qDxNxWhT9NIH9OWQGAhIzhydw=;
        b=ACE2fYbQk3wrn+U/U+C8IoUXlzDSwbd//jlq6GAiTH6wI1hXhWNMWiw17gIRV7/Yyv
         fP3Qjzv4O1y4wPIghvmK14XywbI+1XegE0CVxs2M2QJgLhy8i/9mwOH/RcWPwg5cVuLm
         Hm0o9pj9643UA1qrLqk5pFPc/CXMW+TXK5ERw1H1on2LdAsCAHuZygI3kADIYTgGzRJs
         /H0fgcUYbZ06musZ5ReSqSFfxi5OZI3ZZrhfNRd0ehZI6e40Ts9xifWA5aObTRsIkWsI
         ZBDXQsY2IzWh7Jq/IIJNsLHrHrZJoFoCvHLV7aHu0WM0z3W+LdBNT35BTalSsftN/VSj
         EeQw==
X-Gm-Message-State: AOJu0Yzgt585MtoAR7DKG6NFpo79lhHbRruPNZ0ryAzkuISQCN08t73i
	OILFRjbWo8YXb2a26wA5BbI=
X-Google-Smtp-Source: AGHT+IFfWOtMWlI51gsCD4KJlOf/jtK+BT5g9LX8JW2dluKBVWt32FyiV+Y7h9uROFpJfzveZv3u1g==
X-Received: by 2002:a17:906:10b:b0:99b:4bab:2839 with SMTP id 11-20020a170906010b00b0099b4bab2839mr7104599eje.55.1691323050318;
        Sun, 06 Aug 2023 04:57:30 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id r7-20020a056402034700b0052241b8fd0bsm3789431edw.29.2023.08.06.04.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Aug 2023 04:57:29 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Felix Moessbauer <felix.moessbauer@siemens.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Daniel Bovensiepen <daniel.bovensiepen@siemens.com>,
 Quirin Gylstorff <quirin.gylstorff@siemens.com>,
 manuel.matzinger@siemens.com, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Felix Moessbauer <felix.moessbauer@siemens.com>
Subject:
 Re: [PATCH 1/1] arm: dts: Enable device-tree overlay support for sun8i-h3 pi
 devices
Date: Sun, 06 Aug 2023 13:57:28 +0200
Message-ID: <2233256.iZASKD2KPV@jernej-laptop>
In-Reply-To: <20230627133703.355893-1-felix.moessbauer@siemens.com>
References: <20230627133703.355893-1-felix.moessbauer@siemens.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 27. junij 2023 ob 15:37:03 CEST je Felix Moessbauer napisal(a):
> Add the '-@' DTC option for the sun8i-h3 pi-class devices. This option
> populates the '__symbols__' node that contains all the necessary symbols
> for supporting device-tree overlays (for instance from the firmware or
> the bootloader) on these devices.
> 
> These devices allow various modules to be connected and this enables
> users to create out-of-tree device-tree overlays for these modules.
> 
> Please note that this change does increase the size of the resulting DTB
> by ~30%. For example, with v6.4 increase in size is as follows:
> 
> 22909 -> 29564 sun8i-h3-orangepi-lite.dtb
> 24214 -> 30935 sun8i-h3-bananapi-m2-plus.dtb
> 23915 -> 30664 sun8i-h3-nanopi-m1-plus.dtb
> 22969 -> 29537 sun8i-h3-nanopi-m1.dtb
> 24157 -> 30836 sun8i-h3-nanopi-duo2.dtb
> 24110 -> 30845 sun8i-h3-orangepi-plus2e.dtb
> 23472 -> 30037 sun8i-h3-orangepi-one.dtb
> 24600 -> 31410 sun8i-h3-orangepi-plus.dtb
> 23618 -> 30230 sun8i-h3-orangepi-2.dtb
> 22170 -> 28548 sun8i-h3-orangepi-zero-plus2.dtb
> 23258 -> 29795 sun8i-h3-nanopi-neo-air.dtb
> 23113 -> 29699 sun8i-h3-zeropi.dtb
> 22803 -> 29270 sun8i-h3-nanopi-neo.dtb
> 24674 -> 31318 sun8i-h3-nanopi-r1.dtb
> 23477 -> 30038 sun8i-h3-orangepi-pc.dtb
> 24622 -> 31380 sun8i-h3-bananapi-m2-plus-v1.2.dtb
> 23750 -> 30366 sun8i-h3-orangepi-pc-plus.dtb
> 
> Signed-off-by: Felix Moessbauer <felix.moessbauer@siemens.com>

Applied, thanks!

Best regards,
Jernej


