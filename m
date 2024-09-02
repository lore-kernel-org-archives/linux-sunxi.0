Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6513319F112
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Sep 2024 15:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725290959; cv=none; b=Cf3afSMcJtxut5Fthb0txz+D/WN+PxEQMNN7zTYvGPgltM5z0BA2t9AKrHXYeaCghJUOdj4jnwGqr0t4FS32vnjkIpSumhZFIE20AuTjWZhp7kZcBfiI6zAk/QU1CSFqRDVXtkQXBEmdseVH+FO2xDm8eX84vaRLO/32KAyV7do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725290959; c=relaxed/simple;
	bh=poAqPOIMROfnqP2rDDEjDgczt5K2qIrKqomh2kf3OOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RExfttpZ5VDSdXAbcpqx5lSahG59+2zh1w/fq0vZdsCsaj96ajlHW1XrlFl9/uN+kZE4eTHsSnij8Ixvtj754reRcVLTx48MCioj2mpOwMI8OobmO3Ae5BxU0eTXS3ZVsJXj/FHpE2ButcmcGS7TSGia8YtP9DyjK8hbM0up7OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N7qJtAgd; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N7qJtAgd"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e179c28f990so4065267276.0
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Sep 2024 08:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725290957; x=1725895757; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fufiQCDjVzBKN77iaMjtvnLIV7U6YZAnkOFGTt2N2jM=;
        b=N7qJtAgdRvsUXGGnslaZiVwxj+mWUNvDYXU4iV8NNwaTn+EVArO7W/16npK8zN0Rlg
         k/zzgd0uD5Y865xIectKiO5JmP4JEYz63sdbIiRCMgA2jo2dA8GTtzJoVZsiHxwVun+e
         2n1OpistEn4Fytir6ZwHDdLSQq2Mo9TZkQ+W+CtCdg/GaaRvfzBaVPVQHrJ3OM5SEXWk
         /jnsg6gKZvYEyLYeaT1/W9JC4bcIf6T9VQ9XhxVc6kDWrKi+/xdYq6Mxjst++D0K4sho
         o1moZ014KxVEzINBaG0yZpF1clBxEImbj6z5WnJhpe6I1/M8fX48Vj1jsYpQrnnHNueP
         7ANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725290957; x=1725895757;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fufiQCDjVzBKN77iaMjtvnLIV7U6YZAnkOFGTt2N2jM=;
        b=wYvvMSsvqf8V7Pal7dNJCJMida8CLpFEbq9bmtfEflcKVwlQ2EVZiQu+DM0W4llv0l
         ZPUPhA0CzLWMh3g8urRXA/zECVsrusS64pb+THxKRoKCOx+JA+fhZnSEjMXVNOMNKBzU
         VUsfLehuCKU2gkmNiGnTZLiymhY962BAMCIqWwBI6ChDdmnTrUPtUCQ7ArABZdjTVD8W
         l0NROu1pWvzgu9prwIX2v64SsAZftIlJOfjMXhZy73QwQ1JYfECDSuVDTDS1D8GFTwut
         VyXKQFDT1OinLnUOb6H0DBgldaIijbp4ymeAh7fLT41ezo1ZzqWRfbZb6DTzL2Eh4Ksb
         /rLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXC8BkiyFUyweiYhSuHGWo3c6GpBr6kv7YVL5lRU/DYmwxC3NQ++LJjcYzpi4fmFOnBMZwxSMxBU/rjag==@lists.linux.dev
X-Gm-Message-State: AOJu0YzJbSgOzSFww8Syfhktf+qhVwZgkrct9FvtSeVYTOqOdMHi9mo3
	FRbNvh8Gw8xQsYR8EcTTd3tIvNWYcvSsZmsixMpWDJS5ITYI9eaZ
X-Google-Smtp-Source: AGHT+IHyVyH+g+nijxrV0d5XnMz1GkNSFOfUMxQBussr7msCaVLHFmtyfyB2h1OfmDCWNb1K2wzr+w==
X-Received: by 2002:a05:6902:248b:b0:e1a:a521:f035 with SMTP id 3f1490d57ef6-e1aa5220f06mr4406999276.28.1725290957294;
        Mon, 02 Sep 2024 08:29:17 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c340c96825sm43273026d6.75.2024.09.02.08.29.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 08:29:16 -0700 (PDT)
Message-ID: <1ed619ce-1666-4dba-9cec-70c25411cd49@gmail.com>
Date: Mon, 2 Sep 2024 08:29:13 -0700
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 6/8] net: mv643xx_eth: Simplify with scoped
 for each OF child loop
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
 <20240830031325.2406672-7-ruanjinjie@huawei.com>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 xsDiBEjPuBIRBACW9MxSJU9fvEOCTnRNqG/13rAGsj+vJqontvoDSNxRgmafP8d3nesnqPyR
 xGlkaOSDuu09rxuW+69Y2f1TzjFuGpBk4ysWOR85O2Nx8AJ6fYGCoeTbovrNlGT1M9obSFGQ
 X3IzRnWoqlfudjTO5TKoqkbOgpYqIo5n1QbEjCCwCwCg3DOH/4ug2AUUlcIT9/l3pGvoRJ0E
 AICDzi3l7pmC5IWn2n1mvP5247urtHFs/uusE827DDj3K8Upn2vYiOFMBhGsxAk6YKV6IP0d
 ZdWX6fqkJJlu9cSDvWtO1hXeHIfQIE/xcqvlRH783KrihLcsmnBqOiS6rJDO2x1eAgC8meAX
 SAgsrBhcgGl2Rl5gh/jkeA5ykwbxA/9u1eEuL70Qzt5APJmqVXR+kWvrqdBVPoUNy/tQ8mYc
 nzJJ63ng3tHhnwHXZOu8hL4nqwlYHRa9eeglXYhBqja4ZvIvCEqSmEukfivk+DlIgVoOAJbh
 qIWgvr3SIEuR6ayY3f5j0f2ejUMYlYYnKdiHXFlF9uXm1ELrb0YX4GMHz80nRmxvcmlhbiBG
 YWluZWxsaSA8Zi5mYWluZWxsaUBnbWFpbC5jb20+wmYEExECACYCGyMGCwkIBwMCBBUCCAME
 FgIDAQIeAQIXgAUCVF/S8QUJHlwd3wAKCRBhV5kVtWN2DvCVAJ4u4/bPF4P3jxb4qEY8I2gS
 6hG0gACffNWlqJ2T4wSSn+3o7CCZNd7SLSDOw00ESM+4EhAQAL/o09boR9D3Vk1Tt7+gpYr3
 WQ6hgYVON905q2ndEoA2J0dQxJNRw3snabHDDzQBAcqOvdi7YidfBVdKi0wxHhSuRBfuOppu
 pdXkb7zxuPQuSveCLqqZWRQ+Cc2QgF7SBqgznbe6Ngout5qXY5Dcagk9LqFNGhJQzUGHAsIs
 hap1f0B1PoUyUNeEInV98D8Xd/edM3mhO9nRpUXRK9Bvt4iEZUXGuVtZLT52nK6Wv2EZ1TiT
 OiqZlf1P+vxYLBx9eKmabPdm3yjalhY8yr1S1vL0gSA/C6W1o/TowdieF1rWN/MYHlkpyj9c
 Rpc281gAO0AP3V1G00YzBEdYyi0gaJbCEQnq8Vz1vDXFxHzyhgGz7umBsVKmYwZgA8DrrB0M
 oaP35wuGR3RJcaG30AnJpEDkBYHznI2apxdcuTPOHZyEilIRrBGzDwGtAhldzlBoBwE3Z3MY
 31TOpACu1ZpNOMysZ6xiE35pWkwc0KYm4hJA5GFfmWSN6DniimW3pmdDIiw4Ifcx8b3mFrRO
 BbDIW13E51j9RjbO/nAaK9ndZ5LRO1B/8Fwat7bLzmsCiEXOJY7NNpIEpkoNoEUfCcZwmLrU
 +eOTPzaF6drw6ayewEi5yzPg3TAT6FV3oBsNg3xlwU0gPK3v6gYPX5w9+ovPZ1/qqNfOrbsE
 FRuiSVsZQ5s3AAMFD/9XjlnnVDh9GX/r/6hjmr4U9tEsM+VQXaVXqZuHKaSmojOLUCP/YVQo
 7IiYaNssCS4FCPe4yrL4FJJfJAsbeyDykMN7wAnBcOkbZ9BPJPNCbqU6dowLOiy8AuTYQ48m
 vIyQ4Ijnb6GTrtxIUDQeOBNuQC/gyyx3nbL/lVlHbxr4tb6YkhkO6shjXhQh7nQb33FjGO4P
 WU11Nr9i/qoV8QCo12MQEo244RRA6VMud06y/E449rWZFSTwGqb0FS0seTcYNvxt8PB2izX+
 HZA8SL54j479ubxhfuoTu5nXdtFYFj5Lj5x34LKPx7MpgAmj0H7SDhpFWF2FzcC1bjiW9mjW
 HaKaX23Awt97AqQZXegbfkJwX2Y53ufq8Np3e1542lh3/mpiGSilCsaTahEGrHK+lIusl6mz
 Joil+u3k01ofvJMK0ZdzGUZ/aPMZ16LofjFA+MNxWrZFrkYmiGdv+LG45zSlZyIvzSiG2lKy
 kuVag+IijCIom78P9jRtB1q1Q5lwZp2TLAJlz92DmFwBg1hyFzwDADjZ2nrDxKUiybXIgZp9
 aU2d++ptEGCVJOfEW4qpWCCLPbOT7XBr+g/4H3qWbs3j/cDDq7LuVYIe+wchy/iXEJaQVeTC
 y5arMQorqTFWlEOgRA8OP47L9knl9i4xuR0euV6DChDrguup2aJVU8JPBBgRAgAPAhsMBQJU
 X9LxBQkeXB3fAAoJEGFXmRW1Y3YOj4UAn3nrFLPZekMeqX5aD/aq/dsbXSfyAKC45Go0YyxV
 HGuUuzv+GKZ6nsysJw==
In-Reply-To: <20240830031325.2406672-7-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/29/2024 8:13 PM, Jinjie Ruan wrote:
> Use scoped for_each_available_child_of_node_scoped() when iterating
> over device nodes to make code a bit simpler.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

