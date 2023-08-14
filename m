Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579751842
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Aug 2023 08:09:08 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-99c3d3c3db9so538447366b.3
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Aug 2023 01:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692000546; x=1692605346;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wW73jLCz6WieQvaVVhpG3EtKgyhVpALhxWqDlxdk10k=;
        b=jqCYy3Rwepnr0q4EP509gEzHyPJaOU/Jg5deC7nJrTakv9BmAOMi/nSMf1jwON5F/V
         IuF3yQ35p/ASKUUe9dTzFP78WGE9wcjV4RkNjLEG2C0jmIUCxe15CT8MLNwXgOCj7db2
         oIPDlCHg34KytoFGePzBAvIFJdh0LTn2po2qclayipFFWWA6MUtMaCN0AzJaSYHVu4IB
         CDUKRdbqKaCyg5EAkNxeGrNrD+loCHS9/zmuRqFKESDu14oEkGmWNGxKyy+Vt00RbYd0
         /4K4r+MgkFX/qO79UBebhXCpR9DIDoGi5u5bS2UkGncs6kCzDu1HOLDimuYAjc5cQ0I4
         h3kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692000546; x=1692605346;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wW73jLCz6WieQvaVVhpG3EtKgyhVpALhxWqDlxdk10k=;
        b=YzEw2CT2sHmDhyhvWWxL0PHexS9zizo2Xk2WtdqwolkVmcjFtGn/QrcjAJF1QBkZV8
         UTqNOmbpIJ4vVzxdPBquk8HwLtD7/m7HXN/1nS5bJurM9fY9+DUzgPveYu+FOkQxpdEL
         cT1jj0IE+EIBs7kye8EGuvVtT2s/eb30zor/spWNEeSa0FkTubyenq5N4+zh39K2Oc/T
         cNZNl3Vf1frT8GCYb/4fTliZoPZ90Cti5/jEAF/Jc3FFBYMAtG/EmI+tIVKZnA+IQllf
         9mNQ6r19KmDyPOr9qTqcr7LxQRyTkaq4PEH3TKV5xGwLsYHOOO8bPRAgo+/VQhbbz/Dg
         wyFg==
X-Gm-Message-State: AOJu0YwxRS3hNPzX7OJIXp/DuAqGnFS2Lom32vCRraUL24MNE1+vd4ae
	l0Eg6jtm4bM/uv/H7iIvoMNkUA==
X-Google-Smtp-Source: AGHT+IEgRyR4gQ082IQCVGw8VR3WnXzvZ2IaUK1a4+yaS7LZUkquL49geYE7k2QthCwZcD4rCoZPjQ==
X-Received: by 2002:a17:906:3044:b0:993:ec0b:1a24 with SMTP id d4-20020a170906304400b00993ec0b1a24mr7139171ejd.7.1692000546430;
        Mon, 14 Aug 2023 01:09:06 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id ov14-20020a170906fc0e00b0099290e2c163sm5390760ejb.204.2023.08.14.01.09.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 01:09:06 -0700 (PDT)
Message-ID: <cbc5c82a-dfda-2d46-44a9-6338f2eb505c@linaro.org>
Date: Mon, 14 Aug 2023 10:09:03 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 2/2] arm64: dts: allwinner: h616: Add SID controller
 node
Content-Language: en-US
To: Martin Botka <martin.botka@somainline.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andre Przywara <andre.przywara@arm.com>, Alan Ma <tech@biqu3d.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20230814-sid-h616-v2-0-0267749b4471@somainline.org>
 <20230814-sid-h616-v2-2-0267749b4471@somainline.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230814-sid-h616-v2-2-0267749b4471@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/08/2023 08:38, Martin Botka wrote:
> Add node for the H616 SID controller
> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> index 74aed0d232a9..d549d277d972 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> @@ -133,6 +133,13 @@ ccu: clock@3001000 {
>  			#reset-cells = <1>;
>  		};
>  
> +		sid: efuse@3006000 {
> +			compatible = "allwinner,sun50i-h616-sid", "allwinner,sun50i-a64-sid";

Are you sure? Limited diff context from your patch #1 suggests something
else.

Best regards,
Krzysztof

