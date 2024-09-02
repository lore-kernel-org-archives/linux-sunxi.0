Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF3D1A3026
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Sep 2024 15:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725290801; cv=none; b=n5dReo06YXnd0+THiHOQGkcoXf2FZ4kdiJszvZr+ApuOhkUevay3hrJNRJc8UvYsuWPZRk+5f3iQp8DnseWzD3BkkCRlcBTnyRtbz91mlsZOFQiCvkMEO5ZrTSPCob20uSGWEYAqEzAZFED0L8c5rJ7/ZJIbM/yaRWLuUWxNdOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725290801; c=relaxed/simple;
	bh=+hJLHj0fYznBL/syLfTYCAtFHF/HKzJE+Y5u9J3bp/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=knkqEaYTSJX3X/vjVBi4ax6igwmDKq1E8nvFtYfUNMZFDwqbHv/Zp+XRoARe4X7RRZB2yBOgAMv5Ehj3/oykzS0yZ81Vv3UES73RkVL4N3c7rjlCWYedU0w/1D5qaM5dSh6gAONJd08dOkRU3iy+pITzaeeh5nqquRJ5DpM8eJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cZ5AutO/; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cZ5AutO/"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-70f6118f1b5so2784059a34.0
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Sep 2024 08:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725290799; x=1725895599; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IA2MbtA3XQcGDEci6jrHmcUQxgw9JqO1/5DPWFqsHcE=;
        b=cZ5AutO/vQFM8w5fPRjdLNR2qrAQtffSfEezwITY4p0cxHHxO/jHIdASwSsVcBiJ3p
         G05blp3wXcx5R2wIXzeblIs7dK3fx1u/zS+9w0IiBxGGw9yx8q8EKC2iDL0R4UQgoAmC
         +wvRGrCQY6Sa3uyb+rBsKw7Splb3OOaS1iAiRvZgEB3Da7hzmglfWeVsqfISSWSQ47fQ
         yFd00hFeaHNnZs3wWvApnvs9cQizquuav1RT22/qGt9nmxEDBfchfOds3/u4oieAeHyh
         lCi4igYMhGuU3bnuv4B200I2OjBRMkJ25AyMTi38zcopgEwH7jRgVZYEeIww5yIrPgvm
         2jIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725290799; x=1725895599;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IA2MbtA3XQcGDEci6jrHmcUQxgw9JqO1/5DPWFqsHcE=;
        b=BxUvKB1KxAN/FWbA24BDZ6bCLYEVrKsy00hMgmYgradExrB4rdEWPgYDb4DzJQ2nfn
         kg+W7EZZTOFCyR3t6v92ianbZVoFajBA74B1EKwqIP2/JfQu85koQZkJZazSIYH5bpg6
         Wh0a/dgua5c3PsyouPdHo9IUa9sw2fUmtEhqQyY4b37jABJ43DmXbCXoNMDxGosQBbHv
         lnsCGvs1Kf9FbGzxLQanvq9Qr1ntzACQSoNLuBp3M+0JuM2ue4b6giKCemnKyu6vr+SB
         SJZoHH7RlKyyA6nuxtBd66GyFU4zn7dFpbGZQ/wxUZ+hLVcnP6EKiCq0twfMnmWB+wvR
         rD7g==
X-Forwarded-Encrypted: i=1; AJvYcCX9tRk2lGaiXuyqUyS6/wksGzp06tnGPvMPjoHF3V/iF9KQ+VAvtmG2019Kt9zVGaF8aqT1O0dMEIRzvw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzRRvjyRjSCKmITdc8KCQUobcSc6kjOgEqvGlSLgbPMh7yCBblK
	irctay0UEgc7HW8VlJVNy4u6v1r6Q6oKNmj32aEtrnG5ENNlf1iH
X-Google-Smtp-Source: AGHT+IF07bW552sPbbthy5dPnHRLYc5vy33fJ48YbbjkhNtMXom5R3SmYQ3hp72d+qvDKDmBwC3Mxw==
X-Received: by 2002:a05:6830:61cb:b0:709:46ca:665c with SMTP id 46e09a7af769-70f5c343909mr23650953a34.1.1725290798959;
        Mon, 02 Sep 2024 08:26:38 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c35d6a93d9sm19189356d6.41.2024.09.02.08.26.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 08:26:38 -0700 (PDT)
Message-ID: <1527c728-87bc-4998-942c-9d6d4630e4ec@gmail.com>
Date: Mon, 2 Sep 2024 08:26:35 -0700
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 2/8] net: dsa: realtek: Use
 for_each_child_of_node_scoped()
To: Jinjie Ruan <ruanjinjie@huawei.com>, woojung.huh@microchip.com,
 andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linus.walleij@linaro.org,
 alsi@bang-olufsen.dk, justin.chen@broadcom.com,
 sebastian.hesselbarth@gmail.com, alexandre.torgue@foss.st.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, wens@csie.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, hkallweit1@gmail.com,
 linux@armlinux.org.uk, UNGLinuxDriver@microchip.com, netdev@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 krzk@kernel.org, jic23@kernel.org
References: <20240830031325.2406672-1-ruanjinjie@huawei.com>
 <20240830031325.2406672-3-ruanjinjie@huawei.com>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 HGuUuzv+GKZ6nsysJw==
In-Reply-To: <20240830031325.2406672-3-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/29/2024 8:13 PM, Jinjie Ruan wrote:
> Avoid need to manually handle of_node_put() by using
> for_each_child_of_node_scoped(), which can simplfy code.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

