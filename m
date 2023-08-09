Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E66024536
	for <linux-sunxi@lists.linux.dev>; Wed,  9 Aug 2023 20:14:33 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-790c24db283so5237439f.3
        for <linux-sunxi@lists.linux.dev>; Wed, 09 Aug 2023 13:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691612072; x=1692216872;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IIk54Y5qOOSpo3s//RPyDk3zYw4xwegOFUykoFjM1tA=;
        b=lugWiNoszKBqbK3TRtjRdGUsKgjOToBKfhat7rv/hHwMQzClB4BdqeRH7W542U4LG6
         Io4ZnwgDA3bn6B/4ybAP5uijEqD3LoLlQHUIvL9npNA1O36+eDumnbuOiw75U0fvDi7r
         nyB5tXUxVir1V8C/kDC5Z7PcQNAGbIdA2kkbaVNBgCS2bkbpUj29J90V4tjYtfiDEaN6
         LGB4/XJlYpkQhZncW+PrAgfJdWsxxZVyxmnmroZ5NQ5vEHRBdeB/e7j32xq5t+cmlkoW
         1G09IcUWpYte++hj7p4M9lWjMNfzFzLq57TBcy0QLrLeFftrEkEcE4HnaD/ryK4jdilo
         FL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691612072; x=1692216872;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IIk54Y5qOOSpo3s//RPyDk3zYw4xwegOFUykoFjM1tA=;
        b=N4IcorNJMq6OH4F3Dho9ferbIO9CsJkCcf8fRphTCf6ObLzPplvolYziLh3ZljqRKa
         +Oaz5gBaTMk67hEkLyUyVWVdm2r381HBzgkq+YUsua7BOBqui0x3Das5Soflrlo8TJIn
         Tu2bwZeTSZo1GoGfexsViBaIlgVRV6UPc8Kxz7Zv0aq/xXRtgswVuohtMbDnVnqXn9Or
         Bj4hy9D3EgGrPC0N4kIM2tdEZ0qC/QYXM8WD/d8REyHzqBKFfH0a1xff6oay5RSYO7Pt
         NXELaMq/CLeWn5C+VeoIk/W7o0/XDzCfp+n6n1onBNz7yRU7nrk/i9HumOrPADdGaQ5E
         WwgQ==
X-Gm-Message-State: AOJu0YzrMlkWjfdpaClfakPQK200WBjc0hme0kQjoZ3Xm9ZVezULX5sz
	TL4QYqp88PMraqyk7h40VBS1rLwI0kkLEw==
X-Google-Smtp-Source: AGHT+IH59EFi5I3PtFKyl5yKQnh4PRoO6EZLck3W9zIkaZ3xVJlygFHSTfdIqpxLQYvWgPy4b2BrNQ==
X-Received: by 2002:a05:6e02:16c9:b0:348:b910:313d with SMTP id 9-20020a056e0216c900b00348b910313dmr180895ilx.14.1691612072089;
        Wed, 09 Aug 2023 13:14:32 -0700 (PDT)
Received: from ?IPV6:2001:470:42c4:101:6e71:1f10:2120:d11d? ([2001:470:42c4:101:6e71:1f10:2120:d11d])
        by smtp.gmail.com with ESMTPSA id u3-20020a056e02080300b0034989b3cf17sm346622ilm.6.2023.08.09.13.14.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 13:14:31 -0700 (PDT)
Message-ID: <fffa623e-78ab-491b-dbfe-cde502014257@gmail.com>
Date: Wed, 9 Aug 2023 14:14:31 -0600
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 03/20] pinctrl: sunxi: add GPIO in/out wrappers
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Jagan Teki <jagan@amarulasolutions.com>, u-boot@lists.denx.de
Cc: Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Icenowy Zheng <uwu@icenowy.me>,
 Maxim Kiselev <bigunclemax@gmail.com>, linux-sunxi@lists.linux.dev
References: <20230721134606.4505-1-andre.przywara@arm.com>
 <20230721134606.4505-4-andre.przywara@arm.com>
From: Sam Edwards <cfsworks@gmail.com>
In-Reply-To: <20230721134606.4505-4-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/21/23 07:45, Andre Przywara wrote:
> So far we were open-coding the pincontroller's GPIO output/input access
> in each function using that.
> 
> Provide functions that wrap that nicely, and follow the existing pattern
> (set/get_{bank,}), so users don't need to know about the internals, and
> we can abstract the new D1 pinctrl more easily.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Sam Edwards <CFSworks@gmail.com>
Tested-by: Sam Edwards <CFSworks@gmail.com>

Thanks,
Sam
