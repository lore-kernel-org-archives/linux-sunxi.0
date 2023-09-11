Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7652811705
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Sep 2023 14:42:44 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-52e297c7c39so5686302a12.2
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Sep 2023 07:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694443362; x=1695048162; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6D80ZZPlzZTYiu/9bQG8irFdtGvZCgvK+mghRHHLOSI=;
        b=MKU+Xr7BCktfLfviozee15uRqBF0Ndv01f2KZVOvOaziO0uUFd78MNcGYF+5lYAVqh
         vKYiWcWzdHgR9eaCVQfZ/S8CZW9szLaMJYWyXtwPiP1JUoJrIL0nKghtrx1CN8Cuprqp
         xOo0+vhjAcHJn11ObWUjt16rda39i0timtujY5OCfBdxAQ0o/pj9IvFlvZSD7EAd7QDS
         CwxbXzZyxQ0ZHQPz1mGEMBlYClzMQ+t9+mRaHdj2yhvvQDYbXE8rQk3wvk5WTA/xyoTc
         HmWxFlm8cXS1v5BLmtXLR+1J9rwiOdvyw+S0AbyJhTQFUyDx3dM49OWeupOgjn/sDVsr
         z39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694443362; x=1695048162;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6D80ZZPlzZTYiu/9bQG8irFdtGvZCgvK+mghRHHLOSI=;
        b=fkzhx2T6NCx4UWPbG4ST+eAvq570U61ha+uug4BKrUwO6Lh4FAfLrN7FSUlFmFGP2Y
         e16uqOtstjE1rALMTkcG2Bzls0Em8cGG7kS6BN5yvOCl4QqdIIkaDYvrcgRkBtmRVlOz
         myslYh2WNhixA+ZjsZAoJepL0OrFYaf4rKk5MVJKvcD7vXjy0oI+wU6hSfijCCFvDCN9
         hRVUq0reffsNzejiH2mt15LZHddcXOiqNHABTQ4IGctYVwOyYohsEiMDve60hpHN711Q
         jgqrmVpbSQWOw90RzIRAwZYLs6RTgt/jcsWOn2OfnEE0SVJ8WzdLbFvnCOM9CuT8/9yP
         HMrQ==
X-Gm-Message-State: AOJu0Yxd4VxP3BTJulOxsb+MFbmVmIGdp171xCkgTm/Sw7maslMOwaDB
	kanOUb5QZSQ9eRctXrrgqx4IUA==
X-Google-Smtp-Source: AGHT+IGZ6BAm+BNseM9dLIErk0Fd9vodlBsob22D6rHK/pzDdm5HODd0tU/6G4M7A+HhDA5Ec4sUJQ==
X-Received: by 2002:a17:907:762d:b0:9a1:ec3d:9004 with SMTP id jy13-20020a170907762d00b009a1ec3d9004mr9036507ejc.9.1694443362588;
        Mon, 11 Sep 2023 07:42:42 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id k12-20020a17090646cc00b0098669cc16b2sm5429610ejs.83.2023.09.11.07.42.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 07:42:42 -0700 (PDT)
Message-ID: <f4f0ed21-1e3b-a7c5-79f8-3469c4cfc471@linaro.org>
Date: Mon, 11 Sep 2023 16:42:40 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] fixes the pin settings of two LEDs on board nanopi neo
 plus2
To: longqi <longqi90@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>
References: <20230911140959.2046340-1-longqi90@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230911140959.2046340-1-longqi90@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/09/2023 16:09, longqi wrote:
> Signed-off-by: longqi <longqi90@gmail.com>

Thank you for your patch. There is something to discuss/improve.

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching.

Your commit msg is missing. Please describe the bug or the problem thus
it will be obvious why this change is needed.


Best regards,
Krzysztof

