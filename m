Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A483F11CA0
	for <linux-sunxi@lists.linux.dev>; Wed,  9 Jul 2025 00:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752019595; cv=none; b=WLVQOHHhWM7LTUvKDMAj7X4qmhIKkY3vK76tpTmRydoIph5YAMMonEEE/SKCAoppUeO88py4G293GovlHx7I/YOBbZSyxMOGk0I9SitM1tILts6M0dXI1QzBSeFJvevb9IdIdc2Xqeiw4muXou4GVV/iGB4Rzkr07bQfrPC/P5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752019595; c=relaxed/simple;
	bh=PaZqWqXMYSO6TS14/qLsmC2nFYc2Xw3PQk9S+BP1OUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KvyzXPqCrpO1nYlRnlGvH3mkQB+SUK6dfqkllWUdlDwHaddI9yP/Uo41zxrboLhV0NV3UI9nI0oPKe25dE9uWy9uK7T36NhXqm3mxMRg6bkTSrQ73myLE5WzqlToHDDjlW/p615evg4YyI1QUAopazxJS4IsYygxz6VHIvSObkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=GILP922y; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="GILP922y"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-747fba9f962so383505b3a.0
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Jul 2025 17:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1752019593; x=1752624393; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9fHwIyv9G/G9d2ElUeHUuN1VT5S9rxCMbyr+I9u3NXE=;
        b=GILP922yKiE0xI/JCG/CC1gdSAJPghB9e1i+EU50xYgbtk45vw6aqewt9c2EjehkZj
         wDfGoQA2/TqjY38i74CsVEa00d5gqq+1kEG1qltN0hAfPlz0U/lQleh3rXCj/c/ZOc1U
         PZxqix4dxeZmWSMGnNUAnk8fKwKlIIvxqbcR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752019593; x=1752624393;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9fHwIyv9G/G9d2ElUeHUuN1VT5S9rxCMbyr+I9u3NXE=;
        b=Vc0LYf5lJENXC0WwnLlU5dVLU3cyV2nvmD7uMxUAScYmGFW3X0cZYLZGbXaKsj2EOM
         UCUg4YzNfXongLmOXNrDpFElSmpCsP/c7ZT3vCHwMXAaJYlENFng+SmAryN1NbJZWrOa
         LTy7HHY9CCQ8qeA5fO6yyinfwDhRmXOxd1RTLfn5jfh3BsNZmgbzVeikAzFhqbQaVvbX
         qke3PQFx+nH3WwATld8to0zWbqox389J6mONGk0a3UvFv8yKlA4RBFmoVkeYpJF7nUYt
         zWwKCo6waVYXeeDvszY7QD/0efbhGAtvH/3ekBIbMmVh/DU6hnzDy+Cg4doxN3B5TrM6
         iGbA==
X-Forwarded-Encrypted: i=1; AJvYcCXMiRUWH7KfXuZwViOjo9xEW1gXceFgc8CWT0jbaFQxSnbm9dQW11d5ZrbyV/2Vme+yr0euCSo5qLEpAQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YweZ9WQy4pB1zIY8H9VyhnsrN6GU067WZWMWcmh/o3NdO5fzBD0
	27SqWzQovdoTH8l2jUcAjViPfKTwU+1ZIpl0it4MRDCQcsE0dIz5PDM3TxZv54FIrw==
X-Gm-Gg: ASbGnctei9TtRdyJgn0xQJaOo/bSJq8L9oHNfX8JlVryI+FGlvc7Gs8UGxXTnr8KGvx
	K25ZQAYOlVcNwccigWRZq863Eh2HzT9kpYAKEe6T0Sq2zgjNBz8k2bUAinPqjv4Gu658B4ukB78
	QLjC8cPxVdU8zRU4axAyZhYbhD+DXlyAiGluwr7xoQv2d7VhkJPs7uoDTJvD030kSw4PWZeWJtU
	WgCh1pBnFMpHQlft1fvFFsjP+91zKUGr6XOsNbTwQelJtA94sEPaLI7/gjYTH1keeyxPHgmqmKy
	58qpUZF6Tcj0P1GopgIknBwYLVp5TIlkAjJE24qxAdWN9JXIzVa+5hYuArg/uRq9TNJ70WYYnRG
	fiH4uSyQhjbnDo4PayiI=
X-Google-Smtp-Source: AGHT+IF+YsDibkKRG4hNYPCm+z7B14XbwLmHtSCM1GJNJMtufORbxAG8E0Sby/ii3JnXO0r5SvlBRg==
X-Received: by 2002:a05:6a20:4328:b0:218:159f:1e87 with SMTP id adf61e73a8af0-22b61c6954dmr7148001637.19.1752019592947;
        Tue, 08 Jul 2025 17:06:32 -0700 (PDT)
Received: from [10.230.70.142] ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee4510a6sm12674092a12.16.2025.07.08.17.06.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 17:06:32 -0700 (PDT)
Message-ID: <e2c66c4a-93dd-40e2-9ba0-64c505287754@broadcom.com>
Date: Tue, 8 Jul 2025 17:06:30 -0700
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] clk: bcm: bcm2835: convert from round_rate() to
 determine_rate()
To: Brian Masney <bmasney@redhat.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
 <20250703-clk-cocci-drop-round-rate-v1-1-3a8da898367e@redhat.com>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-1-3a8da898367e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/3/2025 4:22 PM, 'Brian Masney' via BCM-KERNEL-FEEDBACK-LIST,PDL wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

