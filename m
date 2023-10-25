Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E1E286AA
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Oct 2023 14:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6c7c2c428c1so446848a34.0
        for <linux-sunxi@lists.linux.dev>; Wed, 25 Oct 2023 07:05:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698242734; x=1698847534;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XpP/KVLPfr1JGBWdnnD2sOwbC3Inv/m/J6ZxAGnmBtg=;
        b=SoYgOqph6lSOf7prryisZMIrlWO3W8xGkRHDqoHVsw7/I/vunEgieEY7P57fQakt9Y
         4AI81QaaNIf2TB9Upc2xvwdbsKaCbDHZlAO6syEWM2s9pfcJX4yd2pAyp3W47oquSQpe
         HAaSssLAO54Bj91hoVEtfTdmK220qBEXKdcXaTutYoIfvhZDeK8ZB+XPRmzTpVY/rXnM
         RGErXpvZsfa+tKuY+knZhoGi/rfPz2MU0OcV/nsXSeiBhv9ZCvNaP8ErYbn40jkKtwgk
         Q6RTLeGCrwLVsBwllNHX/lrl6tpXtfpzLQw6oBo53tG2VwXmywIHEdcwq7oHZy82GX95
         DNNg==
X-Gm-Message-State: AOJu0YwhZwxrktuCdb6RCHpsVDjZkdj03gX6A28igrlTubWyQGC+bIKo
	2BcCozYUz1/C6mzZAy001g==
X-Google-Smtp-Source: AGHT+IH+6a7epqZvUDTN+14J0hAc961jG6m79dcx8YdfxnNVsEinj19hfONazliwyUi5O5zv8dDu9A==
X-Received: by 2002:a05:6870:45a1:b0:1e9:ac0e:21a5 with SMTP id y33-20020a05687045a100b001e9ac0e21a5mr9331126oao.14.1698242734284;
        Wed, 25 Oct 2023 07:05:34 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id le25-20020a05687c341900b001eae28db525sm2594797oac.23.2023.10.25.07.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 07:05:33 -0700 (PDT)
Received: (nullmailer pid 4149680 invoked by uid 1000);
	Wed, 25 Oct 2023 14:05:32 -0000
Date: Wed, 25 Oct 2023 09:05:32 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 6.7 fix 2/2] dt-bindings: eeprom: at24: allow NVMEM cells
 based on old syntax
Message-ID: <20231025140532.GB4143384-robh@kernel.org>
References: <20231024171253.19976-1-zajec5@gmail.com>
 <20231024171253.19976-2-zajec5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231024171253.19976-2-zajec5@gmail.com>

On Tue, Oct 24, 2023 at 07:12:53PM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This binding supported NVMEM cells as subnodes and that syntax is used
> by few in-kenel DTS files. Modify binding to allow it.
> 
> Reported-by: Rob Herring <robh@kernel.org>
> Fixes: c5330723d5a0 ("dt-bindings: nvmem: move deprecated cells binding to its own file")
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Rob Herring <robh@kernel.org>
