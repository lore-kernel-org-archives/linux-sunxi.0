Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDC117CF
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Oct 2022 13:11:52 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id s3so1793982qtn.12
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Oct 2022 06:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j9+Qzqxt7KgFYl9VgYt697oSnxHcZquHPbAgGS8SmaM=;
        b=i5KopcYd0S5y0FTk8nOqwzf8ktlLqOldknYkrP3HNP4L0gxn1qLfp6zc1VSeil/a4c
         Dj0ATrsfm2XpDxT4RPnP6LLHYrTKzEFncU4SilZIDae2qND+yB5sr1H6kAqJk82ULgD7
         h/ZBZChFmXrw8+k5PsL9z2X+3tA+9BBa1+Nc0xhhqYaKhEOooV4SLrUtEwL6i1XFt5fD
         Cj2TPfB3FhW6GNAL96hHNz8TnskC+0EZg49cZmc1+TJcMX2Nu28bCfC7AgpoCbRp6AiU
         WlAgrkbuIfVXvZZp1CcJQcvRy8rlxZnGXkvep55efNGEmTX4K9VAcac+tPLjiFuZPVLB
         7gNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j9+Qzqxt7KgFYl9VgYt697oSnxHcZquHPbAgGS8SmaM=;
        b=PbrM6F8/Wn3jLiIqsM4zu9WNMpZJBsadLMYg1TGHVUcfnOo9mBSyyESGdM6ApsWhId
         Yf8kFjIwmSV4TWepNw78ibKne0uKlIAH6oHJhGtvqEXyWrKhZkB0Gja/o3FoI2JQbvl0
         JqVnLg2giB1mWbMaLTgsGOewa8C9HMgtXb64RXy4a0qZBTs0bu1FyNTrd07AktAxQB4h
         lQe89ZMlROp8NuWLirUx/ZGxwKUs49PqksIc2iR+bE0EvPHrT53qC5LZwvo1rKl0/RaY
         bRd2JAEATFYsb1cV+LdyPM4vWXWowlPSTBZn6FogUne8ajPBAzAl81jvy3zW9c+Bf+KD
         7ryQ==
X-Gm-Message-State: ACrzQf01wAkyvmHywCcZLlnl/TafDUlWTAH0ey8dWDIUlOpuAz6wgvUA
	UNTHVTF0YOCvvnZ0Ov1UXzQtZA==
X-Google-Smtp-Source: AMsMyM4DfJC9ae7XyPW6fznrM10FQvK0VWx3DRthKZeCyYFIdrTbENb97n54jeRF57xiaUxKMbK7vw==
X-Received: by 2002:a05:622a:3ce:b0:39c:c112:3c03 with SMTP id k14-20020a05622a03ce00b0039cc1123c03mr1737435qtx.575.1665580311970;
        Wed, 12 Oct 2022 06:11:51 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id 126-20020a370684000000b006ec5238eb97sm11062076qkg.83.2022.10.12.06.11.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 06:11:51 -0700 (PDT)
Message-ID: <d483a82a-851c-6907-995d-a59638854fe7@linaro.org>
Date: Wed, 12 Oct 2022 09:11:49 -0400
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 07/10] ARM: suniv: f1c100s: enable USB on Lichee Pi
 Nano
Content-Language: en-US
To: Icenowy Zheng <uwu@icenowy.me>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: soc@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org
References: <20221012055602.1544944-1-uwu@icenowy.me>
 <20221012055602.1544944-8-uwu@icenowy.me>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221012055602.1544944-8-uwu@icenowy.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/10/2022 01:55, Icenowy Zheng wrote:
> Lichee Pi Nano has a Micro-USB connector, with its D+, D- pins connected
> to the USB pins of the SoC and ID pin connected to PE2 GPIO.
> 
> Enable the USB functionality.

Use subject prefixes matching the subsystem (git log --oneline -- ...).

This is a DTS change.

> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
> No changes since v1.
> 
>  .../arm/boot/dts/suniv-f1c100s-licheepi-nano.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Best regards,
Krzysztof

