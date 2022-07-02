Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF511FA8
	for <linux-sunxi@lists.linux.dev>; Sat,  2 Jul 2022 19:12:07 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id fd6so6723019edb.5
        for <linux-sunxi@lists.linux.dev>; Sat, 02 Jul 2022 12:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Sfab9HgfAOoADvsUwSkk4m+M1h+ar5bTh7JdIRbhQUM=;
        b=IZu3Jt7AOIy4gdTFW6XqEe6Vy5q4dQ+7cSaaO5Jp5vqnbQSaeYqiPGKGx07IAhRKDq
         2VyC6TqTHecbOtQGmZQ4FQetwvWbB7MCC8atuWVX6mhiSaZIjU2JpeKPT2WamAatxPql
         QPwEYpNwFuLOWBTubiCV5jL+auYD0ILdi+3I6HvWtXr4pxlQup/lfJB1VuhndRqHu7ML
         MOHHtaIkc+IS5GuSJOj+M293GdqUrcdM7jMRz8BHZmd4v5sXhWZ880Rl1kokCA6DQ4oF
         DugtnNdErNp3rO1moDyy2VCnycHEIMjhIKSM30OKXPIr8VEQ7UrkEAP5FDjLg/JEFosP
         bLxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Sfab9HgfAOoADvsUwSkk4m+M1h+ar5bTh7JdIRbhQUM=;
        b=n7Es0lbW62XPunRqd4FRYRPUgV9pAXFVPRYrCldXu4kKnyw5eifrjX2GHwDsG5RVo/
         HG59LU5ooyFbTr0I7ZNo7ommvrc1kLiB2y6L3a9VSUySq8uTBQBVYy7X5qRqt/+hQYYE
         lTb3YHGrsIDo1VB0FogHce/BlnfOASh+AjZqUz0YECVvO9nTiZl1iSIPQtXSQ4A8UfA1
         nIU/lfK6mbQTFJb/6MqMnw2yciy4UuuMTOCT22f2fhGwH64qleA0/AYU2mbdQNeh/VF7
         BYc4qQeIDh8blJMnJdi9zPSqGAil1Ihl9x7r0VUZj6htT2L9JhwWu/P+s/uOerCIitG0
         IT8g==
X-Gm-Message-State: AJIora8D8FUfnOTIWQuC1m2BLJ55yBlQHFnJ7vslwUM2s4XbiTL9eNOV
	+tgOc/do38svn+8j02Grqyo=
X-Google-Smtp-Source: AGRyM1trQsDgFAgjZCDM6+LfX2t/95nmgyXMYlWVjHe4Y++0mi52iclKRU1r5EvC8sNf+1WcdB+vpQ==
X-Received: by 2002:a05:6402:270a:b0:437:63ea:f2b5 with SMTP id y10-20020a056402270a00b0043763eaf2b5mr27486657edd.33.1656789125939;
        Sat, 02 Jul 2022 12:12:05 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id n18-20020a05640204d200b00435a08a3557sm17349318edw.27.2022.07.02.12.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 12:12:05 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] soc: sunxi: mbus: Only build the driver on ARM/ARM64
Date: Sat, 02 Jul 2022 21:12:04 +0200
Message-ID: <8122293.NyiUUSuA9g@jernej-laptop>
In-Reply-To: <20220702032520.22129-1-samuel@sholland.org>
References: <20220702032520.22129-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 02. julij 2022 ob 05:25:20 CEST je Samuel Holland napisal(a):
> This driver exists as a workaround for old devicetrees which are missing
> interconnects properties, so it is only useful for those specific
> platforms, which all happen to be ARM or ARM64.
> 
> This solves the issue that the driver fails to build on RISC-V, where
> PHYS_OFFSET is not defined.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


