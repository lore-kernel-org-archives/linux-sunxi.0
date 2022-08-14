Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316C0A4E
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Aug 2022 07:47:45 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id a7so8764792ejp.2
        for <linux-sunxi@lists.linux.dev>; Sun, 14 Aug 2022 00:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Hnh4O8lBATWYE9MckUrwDYzVE7Ezy3HP7Kymm/nWvtM=;
        b=Fp6/0M1coVCo0dHzpCuZtyoy5EV5+zwP2A3veaF0rQ1xP89YJfwisOeMA2J5yIhK/P
         Sl1Esknrec0buoonCzK3KNI3D9AFa80+3/V56EmdDGPV6bt95CY4fuzVgdRB/n4mFsDJ
         H+sqK4k79aAUiJXbeAcZmJFsHuXUvti/gdecNZiYucgS9AnZc4a32VOjo2utgb3yPspa
         sLX+8WuyIAZEBJh4ttLUfX3BhZtYlStNkF7oTmCpZLbBy1O78vdD5A29PXz25/W7BsrC
         xdlcwfOsU/bSWaULv3dmii+g2nOMrwi/WrXMN62BqR+dHyzKaM1Fqh3Y2FiocbODd8ag
         t51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Hnh4O8lBATWYE9MckUrwDYzVE7Ezy3HP7Kymm/nWvtM=;
        b=KXlNuLtWxRlu/jQceo5iuBp1wRyVK3v2Ed5PHSZH4T0OXLFGL39WvAkO4qFWg0euod
         je3Un2ySxKUA2NmYI4CBcS4RXWRg7nmEm82oM96hRsQlJ7YulallJv4RoyEHW/fkzka4
         l3VQ+V7N1XhMFPp2HQUXuPUFgqS5tETsQaEkE3kPPuQrCNXOQzkexIEDlM3FhQ8ckoU/
         Rq/3LeRb3Jc3eZAdnYne8LiVzqtlpxSo9UWdyK76hOl9yirpE/NwqVC6FUwhENTE587j
         Rz8y4A5DDDbpxgTi7tsPr6m+Pu0Zazu5GqM0dwTV/0uLNvPpwymMxgPsEOSwHDZ8JFmX
         pHYw==
X-Gm-Message-State: ACgBeo2XPTmlXmGnQhjTe06sxAhG2tnbX+aeyFqyV/9K07Yco5Tif7LM
	Ik6WCInmuPTJXerL879Enhk=
X-Google-Smtp-Source: AA6agR6vANf1pbhVeeVmygcGCmaP0DXMRLm1Z7g9ey+MR1EXQB5U4oGHawZ6EGSAh+bQJawKfVONCg==
X-Received: by 2002:a17:906:fc6:b0:72f:d080:416 with SMTP id c6-20020a1709060fc600b0072fd0800416mr7304325ejk.1.1660463263575;
        Sun, 14 Aug 2022 00:47:43 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id l13-20020a170906078d00b0072af0b036f3sm2666813ejc.41.2022.08.14.00.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 00:47:43 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] clk: sunxi-ng: d1: Limit PLL rates to stable ranges
Date: Sun, 14 Aug 2022 09:47:42 +0200
Message-ID: <2839208.e9J7NaK4W3@jernej-laptop>
In-Reply-To: <20220812080050.59850-1-samuel@sholland.org>
References: <20220812080050.59850-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 12. avgust 2022 ob 10:00:49 CEST je Samuel Holland napisal(a):
> Set the min/max rates for audio and video PLLs to keep them from going
> outside their documented stable ranges. Use the most restrictive of the
> "stable" and "actual" frequencies listed in the manual.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


