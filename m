Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E327B3FC1
	for <linux-sunxi@lists.linux.dev>; Wed,  1 Sep 2021 15:31:35 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id h9so7568471ejs.4
        for <linux-sunxi@lists.linux.dev>; Wed, 01 Sep 2021 08:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dsuhvXX76hOQeJoPDJljlY+ezW6yiXQY+zesm9qzvQs=;
        b=jyVO5OvKrLrerLgG+AMJkCrN67BjtvT7Aoi0OjBblnbirfwF5iV5c4PUfYrKqtgEgu
         n1QgSOJovoFKjR+/km7ubUgfjbZXXfYj8b/z2hXt8fNra0JPuhTsewXkJ8M9E3GN5CK4
         kZfa53Eys8voleaFMBuLQq24RO2V4rT2YNNQmoDDi1vdvX6HwSHJkl+//+b00SpuVBxo
         Wfr8/ipeOP8N8GlUIylYt2oi3NgO5zvpVP22ZxEP279Ej6JN3jniGVrRIYQnzjWwzLEN
         WzmLciSv/eBvrAQX3Mw3Ckycq2k/kv23g0u3uNiyRR51BTQ5pBqrDTqbHuzEDYOxvtkh
         6UoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dsuhvXX76hOQeJoPDJljlY+ezW6yiXQY+zesm9qzvQs=;
        b=CWY2ook6+AtvboiA5jLYYT+kYvB+D9M1WXYd268WW6cKl/4O+4KSfsXYAooIky2Prv
         B9DqirCHHrqBXECBto6prZgBG+lnzbK/EZI173Gy9byea0EKaidxTDTCBIMtOmXPzZ5t
         xh44t6Q2OnBJ/f0adgSIsh3bTJM2lbFblvPYtPUTBnXGIkNieeko0PbXI94FnPn2ac7R
         HciCqwhB8+xL3pfPg8dl9SuEvIMIeMH56Xgy+Zz0FQmp1g4LLK+M1Jp96SDuE+eI5zbu
         wQf87wszfcpr/ECnq/jp0441OPHFo32fPysJLloXdMn7Fa/BhgnoAKliRLE4c2VcVULX
         JIvQ==
X-Gm-Message-State: AOAM5328g9c+BhEn2hHKwBjxsegtkFPaNaQDw8NjnPJOX5Msh9RHKBnq
	gBAEAL/fCtkmQMJxbhq9l5Q=
X-Google-Smtp-Source: ABdhPJy3q16jqERBgwVEnjzmGdMqTZ/q6C8k9CzEfYc7tWekVjbunW10NLYbeHyZi46pnrqzRVtA2A==
X-Received: by 2002:a17:906:680a:: with SMTP id k10mr24000ejr.298.1630510294210;
        Wed, 01 Sep 2021 08:31:34 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id o12sm9626edv.19.2021.09.01.08.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 08:31:33 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, =?utf-8?B?Q2zDqW1lbnQgQsWTc2No?= <u@pkh.me>, Willy Liu <willy.liu@realtek.com>, Rob Herring <robh+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: Re: Re: [PATCH] arm64: dts: sun50i: h5: NanoPI Neo 2: phy-mode rgmii-id
Date: Wed, 01 Sep 2021 17:31:32 +0200
Message-ID: <6939430.QNQgkB6KyE@kista>
In-Reply-To: <YS6WxHtJtNDaBxqz@lunn.ch>
References: <20210830151645.18018-1-u@pkh.me> <1746741.3t3T1tWQfl@kista> <YS6WxHtJtNDaBxqz@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 31. avgust 2021 ob 22:53:24 CEST je Andrew Lunn napisal(a):
> > True, but then again, DT is a bit special, since it's not used only by 
Linux. 
> > It's shared at least with BSDs and U-Boot, which most likely have 
independent 
> > driver implementation. That's why it's good to have DT fixes referencing DT 
> > related commits. As you said, DT described HW wrong.
> > 
> > Looking at past Allwinner related DT commits regarding this issue, we were 
not 
> > totally consistent. Most of them reference commit where emac node was 
> > introduced in DT. But I also found a couple of commits which indeed have 
fixes 
> > tag for bbc4d71d6354.
> 
> All true, and it is not a big deal if it does go back further. I don't
> care, we can let the Allwinner Maintainer decide. Ah, that is you :-)
> 
> I just want to try to keep it simple for somebody who is contributing
> their first Linux kernel patch. If it is good enough, i say accept it,
> and we can do a bit more education on the second contribution.

Maxime, Chen-Yu, thoughts?

Since there are both approaches for fixes tag already in, I guess this is also 
fine.

Best regards,
Jernej




