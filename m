Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA717E
	for <linux-sunxi@lists.linux.dev>; Mon, 25 Apr 2022 17:31:24 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id gh6so6954683ejb.0
        for <linux-sunxi@lists.linux.dev>; Mon, 25 Apr 2022 10:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Lx7n01ak613wao/PeGm56R/NraVbxP43cN5ZMlrScAY=;
        b=AWomtSHBSdpy50i/AiQTF1zEO67p6sM2bAacCXCIrE1EI3drNnFByVmoCM0R/JmKoO
         9gRqHx/Jriy3h41XZP3C0mqTsYL8gZMgJtK5YGBcBAM13cfn2MrAbHZu+63WnkD3pA0M
         DlNSX4/BDpYDhYNLxlybbm4UpTRPqmYx6mc07No5+cFKexLhyMCE/gp0T9Y5ncFf9UlH
         4t+iuhsW2AwBCXq8A0RuQ0hp4vsOhB/eDpAaHSKVH5lGxCZa6y2yaOCbBcLTm58dwi5j
         2mokqtKMGMcjlCu7ZnzTM9o/NOIptNtADfUmrdCmKHoADrK3HZRdkAov3SEu1yD6nH7F
         2pNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lx7n01ak613wao/PeGm56R/NraVbxP43cN5ZMlrScAY=;
        b=U7F7VA3fHPSnA3UhcCBf5MTyk57l6AGwl1NRVaABOk88VmStFhIrrSBYV/8ThDuPty
         NAj+Gj7okL5R6y4RZYXnD24nerEg/g7VvgIuvj+B7J+swdtwBSUQ4sYRIAuRRhQ50lXk
         K4sT5Kg/bfriVwH3pU9niZZ9K+/K8vZtf82TT5O9fd5gHHZnPiwMM9uG4PeYfE72BVlo
         wSDVyi83k97X2OPLX5dNfyau6/7P5p50EgWK/h3My5RuRXNKeuhf1qGh3Q5xNMNUOa+W
         Q35SgVDpNQE+7M7iJNR1yo09D0wvru1V2hY7YGE5UIPNcuZBgbkHcXt+Zpf0IN1TAHmb
         3z4Q==
X-Gm-Message-State: AOAM533F/ZziQwZOVuLlUqFSx1NbhEWifqp26ADh/nYpN3YSk96plxOL
	+6Z3pB1L4i6o9/1vO1wmpEU=
X-Google-Smtp-Source: ABdhPJxvwSr3XtyRkaaNJxbkUJVkHfpHdLP+s0Vc1yhmamJDJWKzG5omORC7vSs528rfOCd348xwnw==
X-Received: by 2002:a17:907:6289:b0:6e0:eb0c:8ee7 with SMTP id nd9-20020a170907628900b006e0eb0c8ee7mr16442680ejc.245.1650907883149;
        Mon, 25 Apr 2022 10:31:23 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id r19-20020a17090638d300b006d6e4fc047bsm3884297ejd.11.2022.04.25.10.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 10:31:22 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>, Maxime Ripard <mripard@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: Re: [PATCH] bus: sunxi-rsb: Fix the return value of sunxi_rsb_device_create()
Date: Mon, 25 Apr 2022 19:31:21 +0200
Message-ID: <2699804.BEx9A2HvPv@kista>
In-Reply-To: <ff0ae741-efc4-ba6f-d869-4cb8fb7149ad@sholland.org>
References: <ef2b9576350bba4c8e05e669e9535e9e2a415763.1650551719.git.christophe.jaillet@wanadoo.fr> <ff0ae741-efc4-ba6f-d869-4cb8fb7149ad@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 23. april 2022 ob 21:39:45 CEST je Samuel Holland napisal(a):
> On 4/21/22 9:35 AM, Christophe JAILLET wrote:
> > This code is really spurious.
> > It always returns an ERR_PTR, even when err is known to be 0 and calls
> > put_device() after a successful device_register() call.
> > 
> > It is likely that the return statement in the normal path is missing.
> > Add 'return rdev;' to fix it.
> 
> Thanks for the patch. This definitely looks to be the case.
> 
> > Fixes: d787dcdb9c8f ("bus: sunxi-rsb: Add driver for Allwinner Reduced 
Serial Bus")
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> Reviewed-by: Samuel Holland <samuel@sholland.org>
> Tested-by: Samuel Holland <samuel@sholland.org>
> 

Applied to sunxi/fixes-for-5.18, thanks!

Best regards,
Jernej


