Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AAE173
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Jan 2022 09:09:39 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id s1so2926495wra.6
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Jan 2022 01:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=uFI93CtNgpLSVgsGqkYUt0u6KZ3ujOeANIDoe0U4El0=;
        b=RHe+7ArESJJteE852aYXPpssf9GAAGdgeCYED9RfNMwpOZLZI46zKd7w9vkePr7y2b
         kRgukMz7dRyxH09vAGR4baW0T6ulLgZeRG3pjLMCzPisrCO6A1ueBkjVi2Xjl7iKoX6A
         18WyDzqFxwwn6fSaU8m9NORqzovZ8Gb74Lv6v8Rr/8sySE7zeokuMZYrtDpcpblFMjEW
         uIYQ3uZw/FuHS51oGiNCGxh+M0oI2gtF5phdNxYkjHaoH/exwGHwnnMxQD+SGDW4sTmM
         Hg69B1IKp/dKLIJZKvFf9QrYRWNCrTM8/pJewYrQ02B8q/NocGXANqc+rVXzx0WKZ4Lf
         tbEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=uFI93CtNgpLSVgsGqkYUt0u6KZ3ujOeANIDoe0U4El0=;
        b=HYwsCNbtsyfvl960P+5T9mfpQ1pNrKRkRLE6/feVPOYPxry67ww9A2U7ODPR+E7nKc
         MTABMAdih2Jeplz+juFQ/5jzpzR7nsUa3Bq6+V+1KxxdjHhcjTgNZO0Wx6lrgvjelM5q
         BZI1rzaPMj9OJEHAomgn4RURw8PS4M6e0pYA8R9jqrhEo+M6bcvK8xEAKeV7labsCd53
         3XynpB37JyafNi9Rb/4FubsfpXzsFxlnhDuS9lxXfeLxGKeNX1AGpQx1zmIJ6vFsDhxN
         n1tdY5GZzoO3HgqNkY5TfycCZF1TKpAcM1A+QMAxPbaW8akPuX7DBMtxQYbrFJjyGuGF
         pDkQ==
X-Gm-Message-State: AOAM532K0uLPZlYCqL1p9VnAkpmCtJT7tNTQaxyuDoG/JkOcjmc6xxte
	FPC3nufI8N8T9uOjn5WwoFk=
X-Google-Smtp-Source: ABdhPJywKaiNXLjM/wWWkgUyAfOy8wmye+J/lUwdTcdaGgUYZpmS8XJverywA140xrcXDhwAfiC8qg==
X-Received: by 2002:adf:e291:: with SMTP id v17mr7069653wri.479.1641978578101;
        Wed, 12 Jan 2022 01:09:38 -0800 (PST)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id b13sm4212525wrm.72.2022.01.12.01.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 01:09:37 -0800 (PST)
Date: Wed, 12 Jan 2022 10:09:35 +0100
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Evgeny Boger <boger@wirenboard.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v4 1/3] net: allwinner: reset control support
Message-ID: <Yd6az3ZlQ4UsSpSM@Red>
References: <20220111160600.58384-1-boger@wirenboard.com>
 <20220111160600.58384-2-boger@wirenboard.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220111160600.58384-2-boger@wirenboard.com>

Le Tue, Jan 11, 2022 at 07:05:58PM +0300, Evgeny Boger a écrit :
> R40 (aka V40/A40i/T3) and A10/A20 share the same EMAC IP.
> However, on R40 the EMAC reset needs to be deasserted.
> 
> Signed-off-by: Evgeny Boger <boger@wirenboard.com>
> ---
>  drivers/net/ethernet/allwinner/sun4i-emac.c | 64 +++++++++++++++++++--
>  1 file changed, 59 insertions(+), 5 deletions(-)
> 

Hello

You need to rebase your patch, it does not apply cleanly anymore due to the dmaengine addition to sun4i-emac.

Regards
