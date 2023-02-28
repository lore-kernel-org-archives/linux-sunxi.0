Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75819475
	for <linux-sunxi@lists.linux.dev>; Tue, 28 Feb 2023 21:08:57 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id h16so45589186edz.10
        for <linux-sunxi@lists.linux.dev>; Tue, 28 Feb 2023 13:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677618536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+8sHszd8r1s6jc7V5kkuEfrl4rZj3zAHu2zSo/SumMU=;
        b=TMuA6ylWu3WLsE2TQIIueU5ev+6P62058sLojmT7SwZdMN48C7tEUqXABoyfdg9n7u
         PfH0hE8mcvk/OZqJHSWLkaslJVv8wJ++ykZrG6sd0Zx18wYo+90+tjMcwpM84TGdNQtH
         rkWBC4npU7xxK7WPVB+fDDs6AnClaew/cOIRYAxLFHpmUAU5JineAaBFc/jlhJQYWNWV
         SjWLsBFLvDKP55V1tuZkf05VuboBGsDF/dZX/2emTfqro20FzINUrM8BItekVwUgl4lD
         eepI7HDVcCl8qONyKezUoAMk1KWJTmvNx6jXuqBAJnknki6TY8L2VKyem5mDV17SaHhj
         zUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677618536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+8sHszd8r1s6jc7V5kkuEfrl4rZj3zAHu2zSo/SumMU=;
        b=IUngiwuRctJv8WPGv1lESvAOtK5HgDdgZzsVIz1GuEvSPjSw6pxbrUbs5Z8Mi1Jrgt
         NTPfwg1wMstEaqmtJHDG16LzOHwdOR/XEzBSZpHkpUgiPSoUN2sq8dZZmaVTuoVOkZB0
         tiWjUJkt5h5JLZ64dxuHzqgYRZN1MoAQ+QY+BJ/WqsBp/sjpAhBiDNkSu2bDl0+5KeVS
         WTUFrwage3LSz8HNoE6Uz4D1ozv2PeLsUjn6bB9qfYgBi8Kpm0vtNFVL/Oi56Cau91y9
         a6BmsBlYzw7s5JIC/a9baY8Evj0qcDZqvYef49poYHrNjLsLklqTrAryBcpXRtWJPfQk
         0OvQ==
X-Gm-Message-State: AO0yUKUt+Yf7V4wBFh5omhe/6Eu6n++bsR4sGYX7vve/MaVOUeK3srpz
	cjUpLo2WtMOrzIgn47AQ/7E=
X-Google-Smtp-Source: AK7set8tEj1Lx2Dr0hwD2WAFi2opZbRBORqgBtiQvBJxZu4oNC/hHvJp0UAjuQ0UJf6HyTamYSP0pA==
X-Received: by 2002:a17:906:1b17:b0:84d:3403:f4f2 with SMTP id o23-20020a1709061b1700b0084d3403f4f2mr3801442ejg.62.1677618535965;
        Tue, 28 Feb 2023 13:08:55 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id ha14-20020a170906a88e00b008c405ebc32esm4875063ejb.28.2023.02.28.13.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 13:08:55 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject:
 Re: [PATCH] arm64: dts: allwinner: h5: OrangePi PC2: add OPP table to enable
 DVFS
Date: Tue, 28 Feb 2023 22:08:53 +0100
Message-ID: <2669085.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20230228114112.3340715-1-andre.przywara@arm.com>
References: <20230228114112.3340715-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 28. februar 2023 ob 12:41:12 CET je Andre Przywara napisal(a):
> So far the OrangePi PC2 board was running at a fixed frequency, set by
> U-Boot to 816 MHz, which is the best achievable frequency at the 1.1V
> CPU voltage provided by the PMIC at reset.
> 
> We already describe the CPU voltage regulator in the DT, but were
> missing the OPP table. Just include the default H5 OPP table, as used
> by other boards. My OrangePi PC2 runs just fine with those values, and
> now goes up to 1.15 GHz.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


