Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3C229CA
	for <linux-sunxi@lists.linux.dev>; Sun,  9 Jan 2022 20:45:07 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id bg19-20020a05600c3c9300b0034565e837b6so4591698wmb.1
        for <linux-sunxi@lists.linux.dev>; Sun, 09 Jan 2022 12:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Gi9wdT5oBY51uN+zY1MwVpQ/L/Lhj3gJuhU6uQRdk/w=;
        b=m1su08LbeO1QD13eo/+OKp3M9WjRJAE8Kaz45RmW61zZ/KHLJTuFEEGlr7OdcQdp6Y
         LRmE73W+JHeQGv9q1Jc3LbukOGWJNs7Anulqo+3FQZHPyShZnUppB4Xhntozni6/NXlU
         Ti6qB0FPK64y6jUD2meZdwvdm6/5BIwLEAU4WwqeDqtKOqvTMnCSDcdanbU1siPDSJlR
         luqBwyH5jm5f5m/0FyUei0zfhnfHze72CEYD/IHeb4ONc8HupgopkR9BxFf5WjokM4M0
         eTRxuIyv2Jayi8ZmUfMdfg1yRZInYNod1HgV0VRmPTZx26GCAadz7olmnd07QVarAku1
         7CVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Gi9wdT5oBY51uN+zY1MwVpQ/L/Lhj3gJuhU6uQRdk/w=;
        b=VjLznxYo0Cx6jZ0x5IX90Z/P+a21tZensS+sx40ZVNkt/44ADDDrghU0PKxEfunjwX
         VU+POkHdRS44+seVlxiGhr151npeCb8FdTcCNP8L0UgzxzjsFFqozFfRnNYMGBQFVyWS
         DwoubkpgBNeUb9bBayGv5uAJDtA3IV9El+GCnzJJ/NSiqJKjpg4qkVzmYL11dfeffUfw
         ocGeJTvmlNO8qbMJNixetbcTeBMhks7SDJ3zlQemisnU9QjO4sa56ro2xEE1PRAu56x0
         w6fbf6li5TKvWSc/esytiWi8MlfVvohS6hG1FpUUc5GOmE+UikYrO6xZPm+f7Z3Rs1ti
         /rHQ==
X-Gm-Message-State: AOAM533RdeIwu/XQX1AeVQL4Dd9YUsreM10J3oc+D9b5jUzMo7MkyaEa
	uE7Me2KGwQUWxseqjyHjFds=
X-Google-Smtp-Source: ABdhPJxaNhA2ItZzKI6DN4P4iEVQQrkjsiqKEKfNL810ixld5yhvQDHS1ieLOJEQh6FXCWW/mskzSg==
X-Received: by 2002:a7b:c931:: with SMTP id h17mr2675642wml.49.1641761105763;
        Sun, 09 Jan 2022 12:45:05 -0800 (PST)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id l14sm5030936wrr.53.2022.01.09.12.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 12:45:05 -0800 (PST)
Date: Sun, 9 Jan 2022 21:45:01 +0100
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: conleylee@foxmail.com
Cc: davem@davemloft.net, mripard@kernel.org, wens@csie.org,
	jernej.skrabec@gmail.com, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] sun4i-emac.c: enable emac tx dma
Message-ID: <YdtJTQJJ4aEUcp/D@Red>
References: <YdLhQjUTobcLq73j@Red>
 <tencent_E4BA4D6105A46CCC1E8AEF48057EA5FE5B08@qq.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_E4BA4D6105A46CCC1E8AEF48057EA5FE5B08@qq.com>

Le Sun, Jan 09, 2022 at 05:17:55PM +0800, conleylee@foxmail.com a écrit :
> From: conley <conleylee@foxmail.com>
> 
> Hello
> I am reading the R40 user manual and trying to create a new path to enable
> emac tx dma channel. According to the figure 8-21(TX Operation Diagram),
> I try to enable emac tx dma channel by the follow steps:
> 1. enable tx dma mode
> 2. set packet lengths
> 2. move data from skb to tx fifo by using dma in xmit function.
> 3. start transfer from tx fifo to phy in dma tx done callback
> 
> But it doesn't work. emac tx interrupt and dma finished interrupt are
> raised, but no packets are transmitted (I test it by tcpdump).
> Do you know how to configure the emac tx dma correctly? Thanks ~
> 

Hello

Here are my thoughts to help you:
- Your email is not a real patch, but an ask for help, so you should not use [ PATCH ] in the subject.
- If it was a patch, "v1" is not necessary
- Your patch below is doing too many unrelated different things, it is hard to see the DMA TX enable part
- I think you could first send a preliminary patch which adds all EMAC_INT_CTL_TX_xxx which are already used by the driver (to reduce the diff)
- Without the DTB change, it is hard to see the whole picture, did you correctly use the right dma number for an easy example.
- Knowing also the board (and so PHY, modes etc...) could help
- I think your priority should not to add TX, but to fix reported problems to your initial patch (build warnings/error https://marc.info/?l=linux-arm-kernel&m=164159846213585&w=2) since your work on TX will need to be applied after this.
- For the previous point, always build test with at least 2 different 32/64 arch. And if possible a total different arch (like x86_64).

Anyway, I will try to test your patch on my a10 board

Regards
