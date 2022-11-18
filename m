Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B51518F
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Nov 2022 20:35:42 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id l14so11125680wrw.2
        for <linux-sunxi@lists.linux.dev>; Fri, 18 Nov 2022 12:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0M89U5r0hCQmLehSOvip12aDjIFbM6Mv2aM9ODkOQ3I=;
        b=XHxEsepY3XQkmXgIWZpM5K0Pn1waQrmgkahJJtAqmiI1meF3FZSqboMtkSz5lKivkA
         oTEdd+YlgwSqYLRtRiwLBzqaJlsC7K6SvltK6qGVvlUqJOwcblbxUfudMJ4dbG5qA+dF
         S62Ew3f8vb80J8ffUJ0aH7xBFcVKnrDrG6GxcTA+5LpRfTkBIk8WqNvcml7Img8ob00b
         p6HBp1ogcw0/7htOXXfTWv6/8osd+03nXuyvfFAkIpWy8sVRcV+BSEqX4t9LSM190kEo
         Ss9jTPzJB5mIPbbuOvuf/n0HmkUHIGsQ5CL19rAbP9et8y26QRppADH5H1U7iUNsVLUR
         1EMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0M89U5r0hCQmLehSOvip12aDjIFbM6Mv2aM9ODkOQ3I=;
        b=AM6BJSYoq1vquxf7txfzIlOhRrj5SAJP5c4AkjszFy7np8KB1H5QoO3oCASSmDeQGz
         3zrLrnqWR+FLdlSwbgq1gd4wW6xXGtqwY0p3bgK8T/10GFNX6SdgYXiVWIKyHLnowPpF
         UAZ5cD6SDHnBC1dBAY1QlMkLu8DYu3yo4dYBbfXsVHQfADZv9eFZjQdl8TJx+bEPfxwi
         urOth4Ar8URLtafFFTlpfFjenTfQ7W0wQLdBXsksnYasdOGZOlO4eGcYvRjOlMaCEn/f
         JUTvlXIZL9T7PiuKPFAoCCsxWIYv4O6xVP9BXXcOSVvGrpXy50Qm8XwlUaRnJmJjqTYw
         uUkw==
X-Gm-Message-State: ANoB5plN/12BAg5QJsgQjYoC2Tru1MGZbsIIanv8+xWqDbaBSd9Pqxxo
	BAygnz9BqU08jOFf27HpmIo=
X-Google-Smtp-Source: AA0mqf40RZwBC981TnheOFjI/w04ROKIAHN8Z5JK02FsvoNi7HHbaao3RphsIxjbSd/92KE8klyLLQ==
X-Received: by 2002:adf:d84e:0:b0:241:7ad0:dd0a with SMTP id k14-20020adfd84e000000b002417ad0dd0amr5406406wrl.290.1668803740690;
        Fri, 18 Nov 2022 12:35:40 -0800 (PST)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id l24-20020a05600c1d1800b003cf878c4468sm11416343wms.5.2022.11.18.12.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 12:35:40 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mturquette@baylibre.com, sboyd@kernel.org, Jernej Skrabec <jernej@kernel.org>
Cc: wens@csie.org, samuel@sholland.org, linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [GIT PULL] Allwinner clock changes for 6.2
Date: Fri, 18 Nov 2022 21:35:39 +0100
Message-ID: <2533334.Lt9SDvczpP@jernej-laptop>
In-Reply-To: <Y3fsBYLMnxcvGKBQ@jernej-laptop>
References: <Y3fsBYLMnxcvGKBQ@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 18. november 2022 ob 21:33:09 CET je Jernej Skrabec napisal(a):
> Hi!
> 
> Please pull following clock changes for 6.2.
> 
> Best regards,
> Jernej
> 
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:
> 
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> sunxi-clk-for-6.2-1

Sorry, this is obviously wrong repo. Please disregard.

Best regards,
Jernej

> 
> for you to fetch changes up to f64603c9729af406167cb9beb66687b1abc4196e:
> 
>   clk: sunxi-ng: f1c100s: Add IR mod clock (2022-11-16 19:49:18 +0100)
> 
> ----------------------------------------------------------------
> - fixed header guard for V3S clocks
> - add IR module clock for f1c100s
> 
> ----------------------------------------------------------------
> Andre Przywara (1):
>       clk: sunxi-ng: f1c100s: Add IR mod clock
> 
> Wei Li (1):
>       clk: sunxi-ng: v3s: Correct the header guard of ccu-sun8i-v3s.h
> 
>  drivers/clk/sunxi-ng/ccu-sun8i-v3s.h          |  6 +++---
>  drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c      | 11 ++++++++++-
>  drivers/clk/sunxi-ng/ccu-suniv-f1c100s.h      |  2 +-
>  include/dt-bindings/clock/suniv-ccu-f1c100s.h |  2 ++
>  4 files changed, 16 insertions(+), 5 deletions(-)




