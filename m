Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6641A3044
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Sep 2024 15:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725290815; cv=none; b=VVav6lw0XbcaOtajavnjCaG0Iv7HOUtB5I+vin0ZLjdH+8MWmVVIC/cJgMuucnM7DM7g9nUBagxwvYA0ZxW+sn1ITMwfAPUH1qNg6/dMzAAb7xP7RtT+zK2m++PypnDlwzIXJajelSpiFUgUpkZaoDg/qn+A4oOmktxbkqa9Mzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725290815; c=relaxed/simple;
	bh=Hydo6wLSX3TmJ6hAUsNs1boJ8DEeaK4QrC2lqHk6uqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Y12KFRoQiu2R7kYns02JU3zkMCcZE8dKmS5yjokbk9fv+5gSd8p8OGd/ogIZpxC/GIftinQhxQJyj7K7wcd7uRr9ahEX0d6k5b1430Nnm+gEOZgfg25DtCRo/GMylW4Afa2a0fmFi9OdHe9QQgfi/7BXDxZRoFM/mbfIW5M6OLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+ecP1Zh; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+ecP1Zh"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7a809736a2cso239679585a.1
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Sep 2024 08:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725290813; x=1725895613; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uNfXUNQx+nhuwQWEGfz+S/XnwSwbncT6JEGOYEdU0M4=;
        b=L+ecP1Zh6VSM3fblYHsEVOd0L6sWv0lsH+Sl0LxWVCdNwagXPk4KCgf2Nu1wOqKTdW
         OiOx93P93/droJmdJG6tx/Y1QwdXxMaXNpTXul3oxweNKYuq8CtEr82gZXEiJi6Z5HEa
         4jNCbBh72qPSb4myiIIDqVfxqZjcK6ZEE2at+aBqGHq1SATI9yLl1ftyZTW3nqOgewbd
         hNfyP5Cb7vNPNdDkgUvMtuKy9nubKPP4dxLcjA0K7MO1mdLDN9lE0zWVKTklVBUEXLFG
         Vg9zC5B0VCiNmc3ye0+dP5Z0uixi21srYq1iw+w0/h8PEJpck8m0SyDSrhH7RB5DlwDK
         WPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725290813; x=1725895613;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uNfXUNQx+nhuwQWEGfz+S/XnwSwbncT6JEGOYEdU0M4=;
        b=iTDHvZFtJgCX4A7b5XVNQZxWlAEwfQKIIi7z2RlFJtwzT0mNmJvRRoveRK1AbaTgqj
         Ffz15H7YhyhLAcIZa1FBgkgsgjXdehipR4+XE/QQO0fWKNkIObVmh6T8jtF1O+V0YPLM
         Aqvb0Q09HJRpAuR4Q95lTtnlUd9fnSB7TfcT2sbmKf0ggTzvgy1yltwkqY3mHkDvuIn9
         GVU4JRZnEPtAZqgma8UJNQ3kQUMg/i8GTVdq5ZboiAUoUjnvLSm8vJ4YwSoe9QJ61wt3
         5bfg/EcgXHn6HuzOkpZ2AXNIdANIar++Gybnh6SYe04VEv4QTHtoxXQ8LNq2FHYlot0z
         lBXg==
X-Forwarded-Encrypted: i=1; AJvYcCWY2Q2HjBNph3VF/gDzLkNdjic+HQg3jZokmd4IgR9ZvTatgyeVoxc2ez7bEbc65mr/IKSA9MHgXLvycg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzzbVKcHX5UiaWlUYwvH5MY+OWqPmJKquJCf05+Lj+uo5E5bQNA
	4arUIyPgRv88rEhU8KWBbG4gDAS2NialtpQ3Vj+iAjPdJDuhtlBN
X-Google-Smtp-Source: AGHT+IE4kIg+Qa/iS71GsqlGe/l6mPS+q7sB9NhTWGT8eov4lUyJRNI5Fa4CGrJD/voh9lSFpEaabw==
X-Received: by 2002:a05:6214:4413:b0:6c1:77ca:66e6 with SMTP id 6a1803df08f44-6c3c62b3173mr3077176d6.32.1725290812560;
        Mon, 02 Sep 2024 08:26:52 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c35d4cb133sm19249306d6.70.2024.09.02.08.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 08:26:51 -0700 (PDT)
Message-ID: <7a83e58d-dd4b-49d0-9ccc-5f5177341575@gmail.com>
Date: Mon, 2 Sep 2024 08:26:48 -0700
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 3/8] net: phy: Use
 for_each_available_child_of_node_scoped()
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
 <20240830031325.2406672-4-ruanjinjie@huawei.com>
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
In-Reply-To: <20240830031325.2406672-4-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/29/2024 8:13 PM, Jinjie Ruan wrote:
> Avoid need to manually handle of_node_put() by using
> for_each_available_child_of_node_scoped(), which can simplfy code.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

