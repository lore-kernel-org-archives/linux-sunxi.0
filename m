Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B9120C47A
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Apr 2025 16:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743784994; cv=none; b=g4HBLZ1cL2DB9jBM6L1wHmkIkNLgII+GaLCWB+f3QJi8mO1cnVnNTEwIEzoPxCEHUZ/jjd7US8MgQyNyZtD3KhBP6FnB2EniYwcQYzmlOopl+SAkqEWbRHGZYgOAQ2QijWidFum7daii2fY77UiOo8egzSmqo4NfL+PF+MiBsSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743784994; c=relaxed/simple;
	bh=4h/h5Ey4YkMehMG/YIdYL0cH70WRN3xek869zn7JOjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QJcL0dk3Rjvpk7TxYb57zX6x0Shvi4j3DTZcWu9jWNyZyuar5EW/MQHDVhCLniFBg5CV2RW288ALvAng/biv7goNghTXSWgsJxzSyno31c3D95INoUu/V34iQZMTw4QYCNwx3iASjyrfhv9LQUkwh62oa1zWqxW1NobZmD7LA+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CiqYl+pM; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CiqYl+pM"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3912a28e629so221198f8f.1
        for <linux-sunxi@lists.linux.dev>; Fri, 04 Apr 2025 09:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743784990; x=1744389790; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xAGsnLdrspAycxCBxeKM44JqaHnIQt6B7n8T1zYYWxs=;
        b=CiqYl+pMdZWz8M6zT3ytQh8VfDo94xDrQ7AWnXS88zdfkBLNUSb1QpYJzetn3OIyPS
         LQKq6Ze02jRH2FNPNC7JgjT2adqcanggUFacLjAVTySgWLDtUpYsE2Oxm2CcbxyX/ers
         WZQE2fwIR33A5UU9itm3VZil7yorhNSaU1X6ASyEnFYvb6GVeMkmNJAUdie+V1oze1bK
         RUnW/Wj2LbTvjGtAxMmda8XIx5Vj0aOwXPjt2yrDjP5Qd9VvDqi/flycLAv75IN1fMXW
         t2b5rYQrWa3VSw5lMDbXBObwF9Uyy3mf8qWK/EuXvDcdqnCsCNhZGizLXllZcfrcVHsB
         aaDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743784990; x=1744389790;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xAGsnLdrspAycxCBxeKM44JqaHnIQt6B7n8T1zYYWxs=;
        b=Dr3sq6Y5G+/tBhdBgDeUt9XqSD1B57pwEek22KyzsdIxlI/lc0p8XdSN05GPRp53ne
         zXPqN4wCMNtJDQa6T8KX04FtY9lwOyUWijA8sTTZ04nsgHjhwdjV1F4pTKi18QKkKoa5
         tseTUY4vh1HjvsjZKmA0Pnf2aAZlY6kkh9zL1p/RzF2cUM0W8yD7CGIPFpLD6n8B/P1u
         iuyJgPbV3lyLRmvhYE+nNv4WyY4ku2u55wQHXnfJaAxE6M+Pkx7tSGYuQXXrdO9KGgZr
         n9CoLHbTMISktwPatxJ/CvVmSntFFGXWdpQeuPVFBmhkAZfiWRBvPyorHdT5wUAvS2kk
         V6BQ==
X-Forwarded-Encrypted: i=1; AJvYcCU44w2wbZAAgf/AGPaFpsKfpcK17zfvdoFqRjh606835FbcgsJzVhtXbqOJSKHTsubmRDJ9/g/aK012ew==@lists.linux.dev
X-Gm-Message-State: AOJu0YxodmU6hatWF7b8FYVGUy4cPl0054/NIdFSbBmUtpMAflRcyHJE
	T9EKowi/Pi117lqfxYnhr/ksj+UN2FMqidJt7nwilJ4UOArjibwryqARR+8fERg=
X-Gm-Gg: ASbGnctvsoTg9B4qiiqnDf+deUw3ufNcrf+33+YOso+Oh3d4nwK3QZ5HT+J5W139DAo
	jEs9IOBmB217TOFMx/lta5XkWCazhNK1o6Nk75+yQnX6bw4rO/RgoBujXQlPIs9HzxZn6dDzj6M
	xVu0BStoikDS59KgoB+lypDs8KFdFPaZ7EauEoHKfQ2ECZCpIQ4Eo8wvFMhb6+tfcmsLQ4jO9o4
	fDqy7yBWxM9gHnaGomx6cIoZV+u4r12vpqrM7BwIZ1uxcNwl+AlLVVfhgEjMLJ9+qFNXbpulnHq
	JAOX8071JjuBm1Nq/N/yvTIMfZfSEIIPCxHUUr1sxJWxJDxebVKfbGqSCj4vsnre
X-Google-Smtp-Source: AGHT+IG2IbUlYSnGQ6rLAHHC6qjUasnOVdNNxP1zU9JNrvGwlwZmuhSUx3coIjZGTA3VjYqWTFYtwQ==
X-Received: by 2002:a05:600c:1d05:b0:43b:c0fa:f9c4 with SMTP id 5b1f17b1804b1-43ecfa03395mr12662335e9.4.1743784990341;
        Fri, 04 Apr 2025 09:43:10 -0700 (PDT)
Received: from [192.168.1.106] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34bf258sm50009095e9.23.2025.04.04.09.43.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 09:43:09 -0700 (PDT)
Message-ID: <c5319e0f-6388-4f9a-82dd-526fdeb4ae26@linaro.org>
Date: Fri, 4 Apr 2025 18:43:07 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: sunxi-ng: Do not enable by default during
 compile testing
To: Andre Przywara <andre.przywara@arm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, =?UTF-8?Q?Emilio_L=C3=B3pez?=
 <emilio@elopez.com.ar>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
 <20250404-kconfig-defaults-clk-v1-4-4d2df5603332@linaro.org>
 <20250404151320.53c4698b@donnerap.manchester.arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250404151320.53c4698b@donnerap.manchester.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/04/2025 16:13, Andre Przywara wrote:
> On Fri, 04 Apr 2025 13:57:00 +0200
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
> Hi 
>> Enabling the compile test should not cause automatic enabling of all
>> drivers.  Restrict the default to ARCH also for individual drivers, even
>> though their choice is not visible without selecting parent Kconfig
>> symbol, because otherwise selecting parent would select the child during
>> compile testing.
> 
> so I remember we changed this to "default y", because there were some
> tricky problems with regards to RISC-V and ARM. See commits:
> 
> commit 0ff347db4c97cc16b4e428dc1db550ba3628f1e2
> Author: Samuel Holland <samuel@sholland.org>
> Date:   Sat Dec 31 17:14:25 2022 -0600
>     clk: sunxi-ng: Move SoC driver conditions to dependencies
> 
> and 
> 
> commit a26dc096f683ca27ac5e68703bfd3098b4212abd
> Author: Samuel Holland <samuel@sholland.org>
> Date:   Sat Dec 31 17:14:24 2022 -0600
>     clk: sunxi-ng: Remove duplicate ARCH_SUNXI dependencies
> 
> Don't remember what broke, exactly, but just wanted to give a heads up.
> 
Hm, I missed that. Quite unexpected commits.

I would expect they to change default to match exact case but apparently
for simplicity they became default for everyone? No clue...

Commit says:
" Do not duplicate the same expression on the `default` line, so the two
lines do not need to be kept in sync."
what it did, but not WHY.

Why is the most important thing...

The rest of the commit msg:
"Drivers stay disabled under COMPILE_TEST because of the `default
ARCH_SUNXI` applied to SUNXI_CCU."

is true, until you enable SUNXI_CCU. Then all of them became enabled by
default, which is not necessary and in general not welcomed. You should
compile test only things which you want, not everything.

Best regards,
Krzysztof
