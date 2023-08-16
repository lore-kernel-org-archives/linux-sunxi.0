Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0168C20E7
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Aug 2023 17:13:47 +0000 (UTC)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-56c711a88e8so4935890eaf.2
        for <linux-sunxi@lists.linux.dev>; Wed, 16 Aug 2023 10:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692206027; x=1692810827;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tVPX9Qa4Xv1MB/edAOyjTE0H1MKHMiTKe7y4N2vO1R4=;
        b=l7BaRVB2Li7p6CutjFiA5K7oKI5cZJeiG9dnXioxpX6ijutkWmyHenD6xii6D/atuB
         xnR4m1gTx3FrTMRk3P+FhqSwKFH9TTE4FZeT1C/sdTb1INiLcGSR+daWQvVCSYI4l1Am
         b2qwe8PogkSXbpDsrEhG6rkWDwxM+O1GS9IsaXvKaMHalOkKQ0I9s1SP5kGwkA6Lmax1
         6oZX3NnAICyltiLoayzKBlH75zziXkLw82cY0ee2Q9DUejOoNPQZpM9AvxglVsdGYof+
         kcHR2v9fvxUniR3YZKpQ8W8S4Mb8sjJfHu/DjbjphfSErgQmFHY4zYptCHaEIqZDI9tS
         bHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692206027; x=1692810827;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tVPX9Qa4Xv1MB/edAOyjTE0H1MKHMiTKe7y4N2vO1R4=;
        b=LKeFc0nSDtISmJ7jGAWmn9Rk3ikpGoBTg66pYaGsGwZ5gcwr2tQeIQBJ420SbnJVrP
         HSN3ULiTppI1ZHQiK30xx6XDdr/YPbh26HXgdvqBpiip1ORM+/dGlyP7j0QnhaRQLumM
         A+ZPCawqYcnQ+0BLSIHwzZiAOKpzzBwKtcbU//ik4Ti1eoVL2JOM8oajqKgUe8Jqs+Ga
         QCmSyiKnUZkhK0ARVr7pIfrZSMJVfsESKW5vCNfqqe4PYVAUN4uchqLaDOz/tEMdYvww
         oUjBt/HOqN4qer6aCcs96Gts8GEs6/rnsKRnTvD0Y3yy3gOBTFOMu1rWzeDDxpuG+Gde
         oalQ==
X-Gm-Message-State: AOJu0YytdDnzx1v1NRseiqu9EIFFPaob5/rJluu9P5k3fZwlJHHTmRnL
	BXM1Ez7XuUcPNSbcYGTDnQpjIzMkySCV2xML11Q=
X-Google-Smtp-Source: AGHT+IGXbdnXyVMyt77d6rfz8tCBtsRlaDJFQsG39SIT4aN2489OiJHDAhWJhJ04YU5adP2Won5oD5Venmj/kqq7Yuc=
X-Received: by 2002:a05:6358:70c:b0:139:d5d5:7a8f with SMTP id
 e12-20020a056358070c00b00139d5d57a8fmr3388507rwj.30.1692206026723; Wed, 16
 Aug 2023 10:13:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230726051727.64088-1-dg573847474@gmail.com>
In-Reply-To: <20230726051727.64088-1-dg573847474@gmail.com>
From: Chengfeng Ye <dg573847474@gmail.com>
Date: Thu, 17 Aug 2023 01:13:34 +0800
Message-ID: <CAAo+4rXRdMQgM-ck+jfTdRQOFafbUx0880G6MQayK5EEwXHLbQ@mail.gmail.com>
Subject: Re: [PATCH v2] dmaengine: sun6i: Fix potential deadlock on &sdev->lock
To: vkoul@kernel.org, wens@csie.org, jernej.skrabec@gmail.com, 
	samuel@sholland.org, p.zabel@pengutronix.de, jaswinder.singh@linaro.org
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Dear maintainers,

May I ask if someone would like to spend some time reviewing the patch?

Thanks,
Chengfeng
