Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B73C2452D
	for <linux-sunxi@lists.linux.dev>; Wed,  9 Aug 2023 22:04:34 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-34978cc9e53so1120185ab.2
        for <linux-sunxi@lists.linux.dev>; Wed, 09 Aug 2023 15:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691618674; x=1692223474;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f34eiUA0nTgGDTRybKTlX8TIPnvOerRc3UrEctcu5kI=;
        b=n8CqfYp1TSlt0bz5U/hytM3Ef349bPIqPY2R+gz4B1k0qAyPDJrzob+JlZqUtUsnbD
         eCVANg/zh+ZNiNDXheEksP5UgN9moVLTWs2fBh/nEOwauACg5+OJvKdVscmWbFxj6Qzm
         Rjz3+GJa2+ubtUx+TlOZOjcg5W31OWY7iDYx51Ku8cF8CZEsyafocPPwXda2LwyvyVjG
         qRugAMLTTP+2/HzQStjk8jie+oEo+QTK66rpB/RvFlUVjWKZI++ed0FNdyXBGnBBvvZw
         l2g4mxgnLxKXC/GCo0CYvQPtQxWjdAqe2k21T5vK1SRIjeDrJeP7QoZ4bD8ZjRZjZI71
         HvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691618674; x=1692223474;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f34eiUA0nTgGDTRybKTlX8TIPnvOerRc3UrEctcu5kI=;
        b=EB3BFWYlW8uqFFR8KHLJtxN+39zIRZK7tymfT/u2A985ucuKHRVUSN1foDToddahtM
         C9XyQ3cF8LFu5WG4lqeMXqGB3xA+DmkaXvQu51leghTy9iAbMtFfF2AyXIwxlHVvKqfV
         iVhPxxrSNkpZlMUpoO1A1sl0Y1qANkI+287S9CthFyCly4dBtopoy/yTNNGOsDpJoaXD
         3MUSmdN2OHn52svK1erjAsrkwBJJ/W1+4IfpWBPqCCLJVeFTAdOVFHNTt+l6iYhJGsCB
         v5BmB299BA1bdDo4nL8e+7iBGVk309584qO2DF/xWKIA0ND1ybDWQPWx5FqrYyZyFOrY
         1fnQ==
X-Gm-Message-State: AOJu0YyqTOUfG5Bj9dMQOawOWNYXxQOoQaZvHmRW5yH6fsO+OvLQx8rg
	5SPwozlOs4m2ZH9KzZXFQIg=
X-Google-Smtp-Source: AGHT+IHAOZuOC3Ig8pf7Ea1YhYbE5w67e8Q+Ls89GZ17VoQ3J3Bn4VxdFEfLN1AwXxHzhHL7HV465A==
X-Received: by 2002:a05:6e02:1186:b0:348:ba80:5a37 with SMTP id y6-20020a056e02118600b00348ba805a37mr489937ili.0.1691618674018;
        Wed, 09 Aug 2023 15:04:34 -0700 (PDT)
Received: from ?IPV6:2001:470:42c4:101:6e71:1f10:2120:d11d? ([2001:470:42c4:101:6e71:1f10:2120:d11d])
        by smtp.gmail.com with ESMTPSA id n7-20020a92dd07000000b00345d10ea524sm4548559ilm.65.2023.08.09.15.04.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 15:04:33 -0700 (PDT)
Message-ID: <746797ed-bf18-3e83-62a0-83e8e90f5fc3@gmail.com>
Date: Wed, 9 Aug 2023 16:04:32 -0600
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 07/20] pinctrl: sunxi: add new D1 pinctrl support
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Jagan Teki <jagan@amarulasolutions.com>, u-boot@lists.denx.de
Cc: Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Icenowy Zheng <uwu@icenowy.me>,
 Maxim Kiselev <bigunclemax@gmail.com>, linux-sunxi@lists.linux.dev
References: <20230721134606.4505-1-andre.przywara@arm.com>
 <20230721134606.4505-8-andre.przywara@arm.com>
From: Sam Edwards <cfsworks@gmail.com>
In-Reply-To: <20230721134606.4505-8-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/21/23 07:45, Andre Przywara wrote:
> For the first time since at least the Allwinner A10 SoCs, the D1 (and
> related cores) use a new pincontroller MMIO register layout, so we
> cannot use our hardcoded, fixed offsets anymore.
> Ideally this would all be handled by devicetree and DM drivers, but for
> the DT-less SPL we still need the legacy interfaces.
> 
> Add a new Kconfig symbol to differenciate between the two generations of
> pincontrollers, and just use that to just switch some basic symbols.
> The rest is already abstracted enough, so works out of the box.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Sam Edwards <CFSworks@gmail.com>
Tested-by: Sam Edwards <CFSworks@gmail.com>

Thanks,
Sam
