Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E38D2F2D
	for <linux-sunxi@lists.linux.dev>; Sun,  8 Jan 2023 20:50:21 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id s5so9810638edc.12
        for <linux-sunxi@lists.linux.dev>; Sun, 08 Jan 2023 12:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/l7O+u7hpvwx/CEE2kQt2CxxFAlI3yQgMXXhNMZZ5b8=;
        b=FDlaf6HuGHd/1r8jZ2JcrzSIODO1aqOOU8QPRxTfVdcd28+Sp/p8K1uUm+WJ66t+eP
         vCE2BDQT9oyeZYP7xXVs6k6R8l1vDzdKzuMRyGEm/UozYAs/UVVw1E0j49Q5VU5mieZS
         XHhtpYeJ1mj76AbggBVYA76nx5hKOx5Zt42DflN6fMAPaFsLmRFbj140pFyzKpeCRjOe
         +8L0vej/ie/lW9+H4QRosHp03GMEiiGwi2SQBscrbeTedyAxkbDD+efVBsxLzLRa5IYv
         btO9dveEcPLEwR/0o6guaAPLnbul8qG8rhcxCYSVmLb14gZaNp7h/nBb3QGUHMTDWMwj
         JeSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/l7O+u7hpvwx/CEE2kQt2CxxFAlI3yQgMXXhNMZZ5b8=;
        b=XN46nRJf5Y8Z5elpfo2G59BKO1m28Y5WyoK0nlZJG4Uy0FOdQcZbBVpLc9wGw/pMXM
         Qg1wQ/u/JQvLTd/YiruSth7gK8sOUM1Q9yQLOh2ZSxiD+ErYrQyARQIj/SCvLt3HqKVJ
         52HIzU45DbevibAy8CW0IEtf2c8PMBSLRCJ697m9fG4nfp5xS0vhG/AOXzZqw1mZREuD
         r5KzKEbKRxNVOk9Ick310zNAgpInNMnxc9476y+GKAaJ+3OhnGhb4TUwybPrLpfMfCGs
         cAC3CNbpH2m2ziDu/tl/AEVvr8CE1reZD6nQaDQMN9B42FrTmvkUCxIn5ZdFeaHzvYlm
         cAuA==
X-Gm-Message-State: AFqh2kqXGOtm3Mw9LKk6VGY59xdZvoJiTpbQf3pznFG8mAMENmX+ayRT
	JRHG0y17qOCfyTtyZ5PVSg4=
X-Google-Smtp-Source: AMrXdXuI0+C7w/IwZrPvBfTWv8oEhkKKunKLQUym/99Og1HUIuARlIEDjFhaBeEwA8yQ5dkAp4HHLw==
X-Received: by 2002:aa7:d653:0:b0:47e:15ec:155e with SMTP id v19-20020aa7d653000000b0047e15ec155emr50820952edr.26.1673211019627;
        Sun, 08 Jan 2023 12:50:19 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id n18-20020a056402061200b004950ef2a09asm2871821edv.61.2023.01.08.12.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 12:50:19 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/4] nvmem: sunxi_sid: Always use 32-bit MMIO reads
Date: Sun, 08 Jan 2023 21:50:18 +0100
Message-ID: <3511184.iIbC2pHGDl@jernej-laptop>
In-Reply-To: <20220814173656.11856-2-samuel@sholland.org>
References:
 <20220814173656.11856-1-samuel@sholland.org>
 <20220814173656.11856-2-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 14. avgust 2022 ob 19:36:52 CET je Samuel Holland napisal(a):
> The SID SRAM on at least some SoCs (A64 and D1) returns different values
> when read with bus cycles narrower than 32 bits. This is not immediately
> obvious, because memcpy_fromio() uses word-size accesses as long as
> enough data is being copied.
> 
> The vendor driver always uses 32-bit MMIO reads, so do the same here.
> This is faster than the register-based method, which is currently used
> as a workaround on A64. And it fixes the values returned on D1, where
> the SRAM method was being used.
> 
> The special case for the last word is needed to maintain .word_size == 1
> for sysfs ABI compatibility, as noted previously in commit de2a3eaea552
> ("nvmem: sunxi_sid: Optimize register read-out method").
> 
> Fixes: 07ae4fde9efa ("nvmem: sunxi_sid: Add support for D1 variant")
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


