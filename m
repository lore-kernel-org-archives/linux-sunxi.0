Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AEC16EBF5
	for <linux-sunxi@lists.linux.dev>; Tue, 25 Jun 2024 15:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719328887; cv=none; b=AkeRWGy1DUO6L08ryCXdyfLXFVkC93OgA7npHZd51ZioFBgkHvEasb/cDTHEEUZ7diI0F8kqqlet+VvxP/n6sptqFabpYqYE0viTDIBdb0NcD+tH+SJqQHiMNS7nXp2RcG7qZV+oSrG4CyDKFg9ZE1PTqOLbQHH/wrDfH/ePKyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719328887; c=relaxed/simple;
	bh=L7dxI5atDsC5KiA+r4b1ljvk5s3mM1vtSwSuKOCRIQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AdLtb120yy8/hTi+DkIHtGMs3oB7yFNbc3OMZ8luZ3pieD5QZpFQBWmO1NfpTXJgkCC+2CobHAuMNu0c8tF1bt2yRebtJwAXaxQfqh5v01S0TmDyXCEf7qKSctfUvNr5ChqW2K+DvUoISzO8o38QDOujnJsSNqbTyUtvnJIk+SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kM5d7oMg; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kM5d7oMg"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a724b3a32d2so323963966b.2
        for <linux-sunxi@lists.linux.dev>; Tue, 25 Jun 2024 08:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719328884; x=1719933684; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Az0heqnLoqAXxETr4R66/gQlMFb6UsVZu78yZT+FtM=;
        b=kM5d7oMg0Ud2fo3oUeaN2Gf8ecC0luet7+Yj0d9c6m4i8NoExtDBSz/FY5gDTrWT+w
         +QKw/JjdQZEiMGx6ZdM6Cf6BfBSK3LpxhuG1mlPCD6NRmWjYIUtR/6mpzh7SqdSfISeJ
         FrE+W1P9Xjy0SWxvjBj9RwR0ku0TfKK2VlW1Iwgi4KF0Q7MnvbMbOn0zUiwb+2LuS3wb
         tBcE5wFpMPPbFGUWmXGzAE/0sefiExvlv5gVHgmOKatGb+tuVK7xm/z9ganryzlcJ/vP
         BzVgoPyIFJFa7v1JVxVJbufowT6feROkhn4uI6obbrm3GSosY2qJJB/FJzuwn62P2m1p
         brYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719328884; x=1719933684;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Az0heqnLoqAXxETr4R66/gQlMFb6UsVZu78yZT+FtM=;
        b=DXdTNg5hdOxLC5z3mb7rICwxQ/8z3z714Y77fbj6RxELly74x3z5dhx53dak1K2PBj
         JUyrde+sGAku/lM50S0oXa21O+/gi1DqLT8rZ/d3BmqgZD2zFln19I15CdaU1Paia6aD
         63TftveZ6IYAZjH9ySuUXXN0EHcZIxVMccWLAzUfiPUT3e5XUpGt7fpFBpfSshCIzTJq
         crHyccaJQOBG/9a9BdoEZesfN7IPPR+BqMExxruSzS6MQNVpm0DgWgS9hVxSe2FZYae/
         Q3Gn6DIMxmFvFhxU3mNorgkxW+ACxwCUMwxBXyDwGXbrJaExH7Bkl1sgtQPJxO/9qU4d
         33LQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSu+wo36QIIByVKMHQfYuTqCFmlhAgnfgW7rzm8yaHu6fgk2ZuDx9kmO+pqJR+Tigc7Ia/lrrxUeBvHE2GF+QcUYhsyuVopVrb/Rw=
X-Gm-Message-State: AOJu0YxKs18cOdhzX8M2YG2flNAnCamORqh4REO/ne5dTmVvbph8Usza
	asZ3fXGH0QjUI7pK6vJSnxTjcWq57ABPorknRhAwj/fXrCOHA4nd
X-Google-Smtp-Source: AGHT+IEwGjcHs3g81KlSF2qV1aaiJY8CUoiJqhsXZub36AqeYKP8R1QA0tBjGpdazjbTFBB6e2fS+w==
X-Received: by 2002:a17:906:9c87:b0:a72:7a71:7f59 with SMTP id a640c23a62f3a-a727a7180b9mr142448366b.57.1719328884220;
        Tue, 25 Jun 2024 08:21:24 -0700 (PDT)
Received: from [192.168.1.18] (175.131-179-91.adsl-dyn.isp.belgacom.be. [91.179.131.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7250f0c2a8sm250967166b.114.2024.06.25.08.21.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 08:21:23 -0700 (PDT)
Message-ID: <81a78629-ea25-4317-bbb3-62a4a3262e27@gmail.com>
Date: Tue, 25 Jun 2024 17:21:22 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH 0/3] cpufreq: sun50i: add Allwinner H700 speed
 bin and additional OPPs
To: Chen-Yu Tsai <wens@csie.org>, Yangtao Li <tiny.windzz@gmail.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara
 <andre.przywara@arm.com>, Ryan Walklin <ryan@testtoast.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Chris Morgan <macroalpha82@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>
References: <20240607092140.33112-1-ryan@testtoast.com>
 <171906943501.1109052.11689701111557656569.b4-ty@csie.org>
Content-Language: en-US
From: Philippe Simons <simons.philippe@gmail.com>
In-Reply-To: <171906943501.1109052.11689701111557656569.b4-ty@csie.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I made some more tests, and it seems the schedutil governors is hanging.

I don't have the technical knowledge to find why or where, but I wanted 
to report it here.

Others cpu_freq governors are working fine (so far).


Philippe

On 22/06/24 17:17, Chen-Yu Tsai wrote:
> On Fri, 07 Jun 2024 21:20:32 +1200, Ryan Walklin wrote:
>> Support for the Allwinner H618, H618 and H700 was added to the sun50i cpufreq-nvmem driver recently [1] however at the time some operating points supported by the H700 and in use in vendor BSPs were found to be unstable during testing, so the H700 speed bin was not included in the mainline driver.
>>
>> Retesting with kernel 6.10rc2 (which carries subsequent fixes for the driver) shows stable operation with these additional OPPs.
>>
>> This patchset adds the H700 speedbin index, enables the additional operating points for the H700 in the H616 OPP table, and enables DVFS support for the Anbernic REG35XX handheld devices, which are the only mainline-supported devices currently using the H700.
>>
>> Regards,
>>
>> [...]
> Applied to sunxi/dt-for-6.11 in sunxi/linux.git, thanks!
>
> [2/3] arm64: dts: allwinner: h616: add additional CPU OPPs for the H700
>        https://git.kernel.org/sunxi/linux/c/b05f15d0fc15
> [3/3] arm64: dts: allwinner: rg35xx: Enable DVFS CPU frequency scaling
>        https://git.kernel.org/sunxi/linux/c/e1e61fe3452d
>
> Best regards,
