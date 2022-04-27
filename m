Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8167B2F4D
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 21:07:14 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id l9-20020a056830268900b006054381dd35so1917713otu.4
        for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 14:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=eivpmiI0Hkgkl9tmdloqYOisXVSDF55bffupxrD3eUY=;
        b=QyA5fD2iTrR7N4ZqjX8s8r76PGsI/1sjO1J0BWax8JZwOEL/yYAYAtRLLP6OihtgyN
         WS3WBE1G+jAHoWbJ/R8unFp1i+dxwJvZSvLxl+53Ss5xSddYinXZiy5y10YLzgXQ+1Az
         M9Cry6MBOe+ayrccQ11myVbnPHcSQvPliO+nPCLI8p9dRBsIRAZPznNbLx9CFheFYsJr
         ZaZBDbxl5PCU4Z4RpmM4KHIGA84eKSV2akOJnLTrsqYuZtnxj/RovZwW8gt6B1Hmkoaq
         ER9eJRdBAUW/adyBz0pWszdgBOY6z9GJP/UcO+70jnya6Dhr5wN03TeblPLDKXXfG917
         joMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=eivpmiI0Hkgkl9tmdloqYOisXVSDF55bffupxrD3eUY=;
        b=n5Az8Y7clYQiqNpFhLkWbWlH2BnGGSvf43m5n6f6YE4IKKy61RlGrMO7IlvZfbJbzx
         VPWDkBkM2XJ+DtP2EzHex2txSjnqYN62K51gVPnRPn0PnTywhF63HCBPFdaZQyjj/zcM
         H0+Qw/wLR0blP6af9I5Mvpq701QH7eIq8ohjtjsyvUwMr/DvlLYcg3N90QVuxGs3dlvT
         QhELGZoejkXSBPgf7Qe9uLKKp2V8pSHmpgtk8XYNOjUgdpmp48L72A6NNtDdEJZ02oiD
         DT0IXvpBZSyVbSOGwBIuF7VlEHdI4tVLWdSsnak+9eQWA1jUIn5HuXozr61cZBCCuEYy
         Mcqw==
X-Gm-Message-State: AOAM5305EklKoafRSNc7sZ7S8mhynJRhR/D63ipeFc+1145baaH/T+rX
	5UyhUvqfg8ZeCa/fTRh1XC4=
X-Google-Smtp-Source: ABdhPJzJwqq+XrqIhFnaOQjnOPKxE6IsCozKRExhs9fI0bHvTLx3Nkxh3LxgTs1KdBpCc3mWfdcDBw==
X-Received: by 2002:a9d:7447:0:b0:605:465c:115e with SMTP id p7-20020a9d7447000000b00605465c115emr10783513otk.345.1651093633607;
        Wed, 27 Apr 2022 14:07:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j17-20020a056808119100b00322e1b61907sm6325014oil.35.2022.04.27.14.07.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 14:07:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3fde4708-2775-6383-1652-12e072b4b9c4@roeck-us.net>
Date: Wed, 27 Apr 2022 14:07:08 -0700
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] ARM: Add hwmon driver for LRADC found on Allwinner
 A13/A20 SoCs
Content-Language: en-US
To: =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>,
 Ruslan Zalata <rz@fabmicro.ru>
Cc: linux-hwmon@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <202204272007.23RK74Ds021079@devbox.fabmicro.ru>
 <6425291.4vTCxPXJkl@jernej-laptop>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <6425291.4vTCxPXJkl@jernej-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/27/22 13:23, Jernej Škrabec wrote:
> Hi Ruslan!
> 
> Dne sreda, 27. april 2022 ob 21:25:12 CEST je Ruslan Zalata napisal(a):
>> Some Allwinner SoCs like A13, A20 or T2 are equipped with two-channel
>> low rate (6 bit) ADC that is often used for extra keys. There's a driver
>> for that already implementing standard input device, but it has these
>> limitations: 1) it cannot be used for general ADC data equisition, and
>> 2) it uses only one LRADC channel of two available.
>>
>> This driver provides basic hwmon interface to both channels of LRADC on
>> such Allwinner SoCs.
>>
>> Signed-off-by: Ruslan Zalata <rz@fabmicro.ru>
> 
> Before even going to check actual driver, please read https://www.kernel.org/
> doc/html/latest/process/submitting-patches.html in detail.
> 
> Just few basic things to fix first:
> 1. subject doesn't conform to rules
> 2. send patch to maintainers and mailing lists (use scripts/get_maintainer.pl)

I only got the copy sent directly to me. Anyway, how is this different to
the driver in drivers/iio/adc/sun4i-gpadc-iio.c ?

Guenter
