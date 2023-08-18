Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7766218031
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Aug 2023 11:39:10 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-99bf3f59905so100780366b.3
        for <linux-sunxi@lists.linux.dev>; Fri, 18 Aug 2023 04:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692358748; x=1692963548;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/laOi+SP39lU/EyzDid33UcDK7VZttaqaW2+wkc3grc=;
        b=sx1DuoXPleOKMSoqg1WukzaDhD4H7pnPoxNtObNJnk0y8WRenGdqq+J+sRajt8uZAZ
         my0XLGY8ola4pYI7Q1vF4IzyGiwai8WLImCqKVO41EuMu2crbOF7SowTSELDziFbk2Co
         rCde2wcixV2Di31ShvrfkcVTariICnk/FIWwgZjenmDLNTerqTOBYD8dnBSaw99+KkU1
         JWVdaj6waNCDQhvGmBZTxlfCzRMBEeVtv9ZFurEcWPdmhWGGmbcv2xBYzv3NRK1w0Jrj
         YiJFidJuq6rv8WC7FR3f74uQf5QFQw+tGlSUeeArf+OcSQLniimn0QfA0ZcN9osfde5F
         5qHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692358748; x=1692963548;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/laOi+SP39lU/EyzDid33UcDK7VZttaqaW2+wkc3grc=;
        b=VXmtJy5LY90n0IMMu8yl5KVxyo/a4JSZQMtx2e3iw7gvr/slYdt2t7vqVF46SqzYaq
         K22T5YjXQsj2p5Pc35u4T8tmJuCTUlsOD9r/XD41z21gs7bpggjQCtkRGjLUlfu35Gd2
         s81+Fb8I2FgTR+cvZ0RLmXcfz1093x/znCb1JnQKhFrzAuLcD89YEKt4i3k0evvXsgKt
         AI64aAb+cj1FL9HgWAxC9yBrT8OJm9FrPwXkXdclu0bsmIZPBaoSxfER2kZSMQlQgURG
         EUjl6L0Rxzldi7n0vkdtqjDusrpMzjtEDvMpymeDjJGGaXgtMYbF1B1FKHVKo+IAFQ3Z
         BsGg==
X-Gm-Message-State: AOJu0YzdChxxXnHc0c1ymZ6kizqdxajj9nAMfYKzu0IS9MpOgVsPdtJw
	rg3mI3WhBWPsNjBr9+iwww14xg==
X-Google-Smtp-Source: AGHT+IFG3vBSNIG2iPZx1gRXxtVo8FXEzSM5gRfMpib/TbrGAHmM0cxXFWf3pY0SVNFRQXFmv/EUaw==
X-Received: by 2002:a17:906:3005:b0:99e:12ab:f197 with SMTP id 5-20020a170906300500b0099e12abf197mr1919493ejz.42.1692358748528;
        Fri, 18 Aug 2023 04:39:08 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id f15-20020a170906084f00b0099cf9bf4c98sm1080822ejd.8.2023.08.18.04.39.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Aug 2023 04:39:07 -0700 (PDT)
Message-ID: <4aea792a-098a-c89a-5b87-f6d27ac1dec0@linaro.org>
Date: Fri, 18 Aug 2023 13:39:05 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/3] dt-bindings: thermal: sun8i: Add binding for H616 THS
 controller
To: Martin Botka <martin.botka@somainline.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria
 <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>,
 Alan Ma <tech@biqu3d.com>, Luke Harrison <bttuniversity@biqu3d.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin@biqu3d.com>
References: <20230818-ths-h616-v1-0-0e1e058b9c7a@somainline.org>
 <20230818-ths-h616-v1-1-0e1e058b9c7a@somainline.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230818-ths-h616-v1-1-0e1e058b9c7a@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/08/2023 10:43, Martin Botka wrote:
> Add binding for H616 THS controller.
> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

