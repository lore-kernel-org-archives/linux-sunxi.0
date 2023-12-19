Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B796A3D0CA
	for <linux-sunxi@lists.linux.dev>; Tue, 19 Dec 2023 17:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pzk9olqR"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40c41b43e1eso61172525e9.1
        for <linux-sunxi@lists.linux.dev>; Tue, 19 Dec 2023 09:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703007783; x=1703612583; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TRnmGv8xzBtREryt49zmigJAc9uozsvO/KimVQjMLww=;
        b=pzk9olqRLveJP2AeeqIjOBxHP+h5xe4QrhfFkY6twmXpWzKSDjq2vlbDoGq1miJcM/
         XY8K8yvonvKT7duwS/HDvUaj6QiLIeKPrSSMi6HnwBeFTl6CTHgUsTkiPomrciXbhsfW
         O2zuY01VWRXsFVXC0kvYfa1GVGGoGEKXEPfmaUCC/mnp8/DKGQBypbq8Y+4paLOsag7p
         kXuskhYSCakgHFNaSAx+WwMHHQLoYBVbD+d9/Q1eV2PqO47qBAX1HwFosRh4DbtVSaoS
         vvzoeNQT9OWFh31Lu0XgUkvVnqdQfRzAqXWBmlfDq/esF8v3EaZVAFMg+MjIXtEDgcHC
         ljAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703007783; x=1703612583;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TRnmGv8xzBtREryt49zmigJAc9uozsvO/KimVQjMLww=;
        b=uv6kLuTS2GTNICWwDdCocBeda4VXMxwOHv3DGvfG40QrOGPtC4xHVI1X5Jix39fMIr
         wLG2mQcgtl/P8r46mNGvm8Cdx9CDs1++JP2eGNK2LsqFls9RRBoi+OsDt/nVWtFxFqF2
         IJEniaULqm4iuKDQpWe8oIlf3M3huGk3SJYzslJivxibk1QrCJX1PR/eXOOp1Jd8Ow/m
         N8nmDQQAR7q1hudHCVxqKOp4ckR5+v6sPJoI+Qoc8ODsVlf7SWBihat1lzxIDknNYgUR
         NWgqwPzz2UXvWShuCzQ83BD9hHKlhGPq8KkBooteKUNpfZ36tscGn+jUPz/9rt6xXxgq
         hyMQ==
X-Gm-Message-State: AOJu0YxAwZ5brnQ+PQSvYC4GUz0f45CgPsdkKVhqCpdsRanHO/F2bKJ6
	sFJ8JTl6RXkP3xbvxFjUUq047w==
X-Google-Smtp-Source: AGHT+IFuUu0ohM0DgqSQKkmxColi/SAtbH6YHORkgyaGUdrSffYDo7d3mbYVlsllH+lOmS2Eou5MzQ==
X-Received: by 2002:a05:600c:2051:b0:40c:6924:5f2d with SMTP id p17-20020a05600c205100b0040c69245f2dmr4379823wmg.231.1703007782984;
        Tue, 19 Dec 2023 09:43:02 -0800 (PST)
Received: from [192.168.10.46] ([37.170.14.102])
        by smtp.googlemail.com with ESMTPSA id c9-20020a05600c0a4900b0040c6d559490sm3942666wmq.3.2023.12.19.09.42.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Dec 2023 09:43:02 -0800 (PST)
Message-ID: <4ed663b6-6c1d-43ed-8417-1704b9adfbae@linaro.org>
Date: Tue, 19 Dec 2023 18:42:57 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] Add D1/T113s thermal sensor controller support
Content-Language: en-US
To: Maksim Kiselev <bigunclemax@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Marc Kleine-Budde <mkl@pengutronix.de>, John Watts <contact@jookia.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20231217210629.131486-1-bigunclemax@gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20231217210629.131486-1-bigunclemax@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/12/2023 22:06, Maksim Kiselev wrote:
> This series adds support for Allwinner D1/T113s thermal sensor controller.
> THIS controller is similar to the one on H6, but with only one sensor and
> uses a different scale and offset values.
> 
> v6:
> - Rebased onto 6.7.0-rc5

Applied, patch 1 & 2

Thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

