Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3612870
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Aug 2021 18:27:10 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id e25-20020a05600c4b99b0290253418ba0fbso544997wmp.1
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Aug 2021 11:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=DTKhTm7Ptg33LCmAo/w+iCwbuM4MPLTXMtIM7VJDESs=;
        b=XSipToRaSYK8r/yD7Y2zbkP6xbYJje+aooSF0mhT0oVLuyaMKIePaSg1zx3ZCe8RbB
         kS/zCjZ24853zmMTLuE+JMDuQ/seXGbLPh0BYIj1AbbbudTfAOnPO6ATTr7ruQfi+OuM
         harDKQpcKQdzKJlIfCjqbcDlDmVI84AYKvIHQ6fBG1BqnTk9jUMbtVQz8WKzaUCLLnS5
         nFZw1RzFeWCd7OfGppbdPpaBi5h2c7gjY6A8S8ngAC3APaD2+EAeXGDu/aZC/pgOSHhy
         rwdfCq5trcb1HvacEODObZ5X5WYYx3LmWsaJ+G/95MC4DAjT+LEDXrMOQNqVwTlJR9Dk
         mWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=DTKhTm7Ptg33LCmAo/w+iCwbuM4MPLTXMtIM7VJDESs=;
        b=GYOOc7xMhqKEEy+L5kOPKxrvRth1t7++aTzGCAHokUIecCcvHZfxDAaQXuRczf/vn7
         2+SmP7uBL4pXDA/ZkYR+aoAzxyBP2ZT8PO5sF0LqYLVgW1v6cULxvyJ75WfTPXgBsWvZ
         StTvR4r/liUFF3fZJHc8N4/wF74aylvYxcD5eDCceYvlBTb2WRpE4vqwwHVyJDkRWlHU
         1cB9NQf8yMwkrltCnW2VleoM6WiNrPzWg2V8lbjP2gby/gRf1K2Rd5+5vl1DcdEvp44y
         uOF3l2nzgZYKGo7wO0KMwWFZDBiFNsoBLrfcai9eM7Wak5DiTsvt7fLJd4VHvywAU8Kl
         kI0g==
X-Gm-Message-State: AOAM532yJ+OLYvHywaxI0eRBDx8SC/Fp3zjZbgLLRgQc1mKh9J8WuUSO
	OnFJwsJyNEY3h3WZFRE/Bz0=
X-Google-Smtp-Source: ABdhPJymktIwUnfQLR4bmt28w5+VecVM+04e+/xdZY89WAq8zBoRUTO9t6fdiK4z/lEwUTGG2ZhK6A==
X-Received: by 2002:a7b:c5c7:: with SMTP id n7mr18520297wmk.5.1627928828647;
        Mon, 02 Aug 2021 11:27:08 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id w5sm14025259wro.45.2021.08.02.11.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 11:27:08 -0700 (PDT)
Date: Mon, 2 Aug 2021 20:27:06 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Dongliang Mu <mudongliangabcd@gmail.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Xiang Chen <chenxiang66@hisilicon.com>,
	Eric Biggers <ebiggers@google.com>,
	Colin Ian King <colin.king@canonical.com>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] crypto: sun8i-ss: fix multiple memory leaks in
 sun8i_ss_hash_run
Message-ID: <YQg4+skrb9dxMgHw@Red>
References: <20210726152533.2281139-1-mudongliangabcd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210726152533.2281139-1-mudongliangabcd@gmail.com>

Le Mon, Jul 26, 2021 at 11:25:21PM +0800, Dongliang Mu a écrit :
> In sun8i_ss_hash_run, all the dma_mmap_sg/single will cause memory leak
> due to no corresponding unmap operation if errors happen.
> 
> Fix this by adding error handling part for all the dma_mmap_sg/single.
> 

Hello

I have nearly the same comment than on your sun8i-ce patch, (copy result only if err===0 and wording).

Regards
