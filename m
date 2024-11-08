Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE48206E99
	for <linux-sunxi@lists.linux.dev>; Fri,  8 Nov 2024 23:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731107706; cv=none; b=VGHIZr6yMs1TJ77DsNR8DPtqJM+fIsP1cpiyCDx4JXlTqCD3jfMunBLU0HUnDoMtc7ODoZ6Jrf3W+SE1fEwnAVZRI2rDq2vunKo7g9dEbYzgiurt7KeO0vqHVJnLR6fF3nWVpHURAov914wfoH/xC3hXMpBSMHukremY0gM2Rog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731107706; c=relaxed/simple;
	bh=NE6pg3wRdGXtaaI09FPxI7W/E9jCi25YgqePb0Juy4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FG3bQQCnyhsg7gc4fUE5qygWWZ/vER9VNz5o94Ag8va+H3KCFozl12DWdc9rfKQSndReHnvTCyFKm4o+NvJ+eWYvPADSpu4t+eiaA/XI0xlTxvJavOK3+xmbfXdaudaQA4vX+Po+abwjQrL1gJQ/4nuQ1cQNscjj7n8EMEpp9Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wirenboard.com; spf=pass smtp.mailfrom=wirenboard.com; dkim=pass (2048-bit key) header.d=wirenboard.com header.i=@wirenboard.com header.b=N666v7/U; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wirenboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wirenboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wirenboard.com header.i=@wirenboard.com header.b="N666v7/U"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d70df0b1aso1565399f8f.3
        for <linux-sunxi@lists.linux.dev>; Fri, 08 Nov 2024 15:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard.com; s=google; t=1731107702; x=1731712502; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0oSoie1qIRXgWGFb6cKb7mnY6LaDSDkqhi5T4II1in0=;
        b=N666v7/U95mY3KgE0ymLyQtIdzL4w8CZI8/pF6nnCP0beUCKVxFvsF4NF2AkTz3qHO
         0Mh+q8803fqdeie/uU1gEV16ecYSeksLkC9PaTJwuR+yYxm37vYa+g03w3y9jYaj/G+i
         ysBqqFd/0YItB6d8Bi2mc7b7xAj3SBBQbkSs2otHEhPUC6IeNwl3sc4RFNJRntWjKA0t
         pejzi5QO6SZUCC4motFGcVeSGU0mo8YiFjWPPa8W0P8fW3qg5mNnmkH0TZ8YsxYPoEGL
         TzsGihk77dFTY0eJ3dncrRtF+8AYKApiZ46AzxLxcjTHKRhfAxycAViKkENpcIvEE6bc
         xccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731107702; x=1731712502;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0oSoie1qIRXgWGFb6cKb7mnY6LaDSDkqhi5T4II1in0=;
        b=RY5GUXKJz3fBVbt+Zj3DohqdomCmV5nogT0o8aHTMMoPWccK93/SAKUxcl998GeQRZ
         5nyoGg+X+6plHRinqcxTyqAMTG9jzeDkQcfgFEJCL28+OWX88fB8JyjRyvzjDFpEtRVQ
         WYJfTcYGDyUf+IPxPKeuGYPE6o9X3bShLue06GNzpfYfQBhdFH/DLTmF3OnJRmzE4I1A
         dAhpBgu6F7w5B/bNILsPW1lCPuhCoKHGUvUrrptDTWkOaRjR8jt/1eIt/vPZfrxLbxqm
         8H6RuyDpxlQKzYKXDaOFWQixDUjDaorEFT6rweFF0E9kyl0c7LJ5WiYg49x6zpxL1ra4
         vhsg==
X-Forwarded-Encrypted: i=1; AJvYcCVE7V8pOY4LbbQwaEuSekknhJ6oISb4JryN4M0hqZdivs8ub6pkW1lOO/eEOuEoKluhlXW9qp06HSe1vg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy50eggIWIjgbU9/MRUeBRMn5Sez0DMoglz8/wAT4r331FdUIQT
	/iWMmYf6bm3PR1/6M/RAsdrOeK+9Mrb1btTSk7c8KZXgFTGi2evI01uTAYMeSpY=
X-Google-Smtp-Source: AGHT+IEkXE8e6btQk8tjWEgg1I5q8fB3JHMfs8pcIcYIogpdbfL+NQYAjuHnUilwSeLh4eJW9S2S/w==
X-Received: by 2002:a5d:5f93:0:b0:37d:493c:f7b8 with SMTP id ffacd0b85a97d-381f1867129mr4149308f8f.2.1731107702379;
        Fri, 08 Nov 2024 15:15:02 -0800 (PST)
Received: from ?IPV6:2001:4c4e:24e5:bb00:6639:286e:9ea6:bb49? (20014C4E24E5BB006639286E9EA6BB49.dsl.pool.telekom.hu. [2001:4c4e:24e5:bb00:6639:286e:9ea6:bb49])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-381ed970775sm6137066f8f.13.2024.11.08.15.15.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 15:15:01 -0800 (PST)
Message-ID: <a4fada26-7ef8-4618-9ddd-0962b7dc6efb@wirenboard.com>
Date: Sat, 9 Nov 2024 02:14:59 +0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] clk: sunxi-ng: h616: Reparent CPU clock during
 frequency changes
To: Andre Przywara <andre.przywara@arm.com>
Cc: jernej.skrabec@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev,
 mturquette@baylibre.com, samuel@sholland.org, sboyd@kernel.org,
 simons.philippe@gmail.com, wens@csie.org
References: <20241025105620.1891596-1-andre.przywara@arm.com>
 <7b63b316-4cd7-48ee-ae32-3750d25e2307@wirenboard.com>
 <20241108223400.460982d6@minigeek.lan>
Content-Language: en-GB
From: Evgeny Boger <boger@wirenboard.com>
Organization: Wiren Board
In-Reply-To: <20241108223400.460982d6@minigeek.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/9/24 01:34, Andre Przywara wrote:
> On Fri, 8 Nov 2024 23:14:51 +0300
> Evgeny Boger <boger@wirenboard.com> wrote:
>
> Hi Evgeny,
>
>> Tested-by: Evgeny Boger <boger@wirenboard.com>
>>
>> We had stability issues with some of our T507-based boards. T507 is the
>> same die as H616, to my knowledge.
>> They were fixed by essentially the same patch, which we unfortunately
>> didn't submitted to mainline:
>> https://github.com/wirenboard/linux/commit/dc06e377108c935b2d1f5ce3d54ca1a1756458af
>>
>> It's worth noticing that not only the reparenting is mandated by T5 User
>> Manual (section 3.3.3.1), it's also is implemented in vendor BSP in the
>> same way.
>>
>> We tested the patch extensively on dozens of custom T507 boards (Wiren
>> Board 8 PLC). In our test it significantly improved the stability,
>> especially at low core voltages.
> many thanks for this reply, I was hoping for such a kind of report!
> I typically don't test those things in anger, and only have a few
> boards, so having those reports from the real world is very helpful!
>
> Can you maybe give some hint on how you tested this? Does "at low core
> voltages" mean you forced transitions between the lower OPPs only, or
> were the chips undervolted?
Both, in a way. Some boards (about 1 in 20 or so) would hang after a few 
days of operation.

During our investigation, we found they would never hang under stress 
testing, so we started examining cpufreq-related factors.

Disabling lower OPPs also prevented hanging. If we artificially lowered 
the OPP voltages (undervolting the chip), the boards would hang much 
faster without the patch, and even the previously stable ones would 
start to hang.

>
>>   From my understanding, all Allwinner SoCs need to follow this kind of
>> procedure, however it's only implemented in mainline for a handful of chips.
> Yes, I saw, I have added this to my A523 code already, and prepared a
> patch for the H6.
> Do you have boards with any other Allwinner SoCs you could test on, or
> even already have experience with?
Unfortunately, no, not really. We only use the T507 and A40i at the moment.
We’ve never had these kinds of issues with the A40i, though. By the way, 
the A40i is among the few Allwinner chips with reparenting implemented 
in the mainline.

The A523/T527 is really nice; it's a pity it's limited to 4GB RAM.

>
> Cheers,
> Andre

-- 
Kind regards,
Evgeny Boger

