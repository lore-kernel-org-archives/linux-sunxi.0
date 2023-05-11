Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D47220696
	for <linux-sunxi@lists.linux.dev>; Thu, 11 May 2023 16:39:34 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-965fc25f009so1321948966b.3
        for <linux-sunxi@lists.linux.dev>; Thu, 11 May 2023 09:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683823173; x=1686415173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1X+KxaJIVgVYeyuNeujb/8uBRFLjXmO+GYF9SJ60beU=;
        b=Ma3S9GWfat9WnqrYyoHgo5dry853rcAt7P66kj6bNzlHIiIB+6Y/+u0gBYDLzcuSdu
         vT1NW6MdOAyowFiuwWrbGQUGRLvowFSEqjZQw76i4sNrDKXSSMTY6DwL5LTHaU0GNNfP
         46M8g1qCVkRdo+8/WCCNVM5ooDFEVCo6Fxjexl3Hzbo1ZY3rKp2tqkTiQRwtVqcnmwCW
         Lo9afas3hvNaSz8vp/KNwWiBK2QlCfuxc7kO9HFgyIJK3hawuFkfV9U9Ugn4Sj/XiMt8
         lKxG3hjb95hmBIakmQqo8CVQcVhnhtqdZyNtn12O5VmFGMAqRgwEcehYILx/HtRJvH5f
         6pOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683823173; x=1686415173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1X+KxaJIVgVYeyuNeujb/8uBRFLjXmO+GYF9SJ60beU=;
        b=hWW5w5I984yYgmPC8IffP3ouFtxC+D0dzpWykQ+bUh1RpKU65p2Bk0YD+JLsxKKPsk
         SYacMlch2o2mABNaHfv2I+rPI5KwMpQ6F5nXnLf8eX8L8RjMcJo/5eioTSIx9m8SEj9c
         h0vYRv/oyArwbq+Ee/9qoQ+xbQmHG2HtkAb/op/nKDOcwVkOEQ2H1l3g/lNna2a3AweQ
         kHpexxnIOdQqhEzg8KMDE86h8YOlyVCXdskk1GOdUvztx6/cTdUMEFIcma8k9Rg1AgVu
         ayU0mhMBLSsKwhLpHq1+svB3ppGohCFsjTASQEKnNBXVwaq+M80ZIoZGG80YHpAlq53y
         IDwg==
X-Gm-Message-State: AC+VfDxlKx1+WOb6dpZvKKhMFofOvYR0BfbjXnXgsUBNDw/sHfpGbqxr
	rXBNOu+YxLOaKSMg1+lVo74=
X-Google-Smtp-Source: ACHHUZ5wFJGKUF0ZD6faiGAglKWn8oRRHvDFWFpErE5pc3yl110oDTNxwsggOt4RFsmN3fJSCYNXQw==
X-Received: by 2002:a17:907:3f25:b0:969:edf8:f73b with SMTP id hq37-20020a1709073f2500b00969edf8f73bmr11308254ejc.60.1683823173131;
        Thu, 11 May 2023 09:39:33 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id t27-20020a170906269b00b0096616aef7e5sm4339459ejc.149.2023.05.11.09.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 09:39:32 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
 Maksim Kiselev <bigunclemax@gmail.com>
Cc: Icenowy Zheng <icenowy@aosc.io>, Maksim Kiselev <bigunclemax@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Maxime Ripard <mripard@kernel.org>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 2/5] spi: sun6i: change OF match data to a struct
Date: Thu, 11 May 2023 18:39:30 +0200
Message-ID: <4268659.ejJDZkT8p0@jernej-laptop>
In-Reply-To: <20230510081121.3463710-3-bigunclemax@gmail.com>
References:
 <20230510081121.3463710-1-bigunclemax@gmail.com>
 <20230510081121.3463710-3-bigunclemax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sreda, 10. maj 2023 ob 10:11:09 CEST je Maksim Kiselev napisal(a):
> From: Icenowy Zheng <icenowy@aosc.io>
> 
> As we're adding more properties to the OF match data, convert it to a
> struct now.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
> Reviewed-by: Samuel Holland <samuel@sholland.org>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


