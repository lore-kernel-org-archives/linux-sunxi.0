Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376828C0B
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Feb 2023 19:34:46 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id e9so1225265plh.2
        for <linux-sunxi@lists.linux.dev>; Tue, 21 Feb 2023 11:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/17f+DzetPf5Wbn+q3zaaJ9PFuWaNoMs35ocYvK/NiU=;
        b=UZqQtVF4IiQJvFWIapVaJlYuyBGibLTENnCKujiaGZ27SONdSe0x8FzpmmPg+vOL/2
         5mgvo9NY6cTBwPDOuB6O1VWbuFieyO9VoUjv29ZlkA5y9pra93NWHwqyWnb5U+kAWOwc
         kNVqn7A3sEFTbmFaxi1veyaH1sT8KY58dQS5b/NpniVoD3BE+osE6QIeFlX8soGjWiYP
         57b0theKy9rSF7GiZtIGE/rk/zdslETukshIFm+SGU/n335ANt1EVO2CfGK9ePyn9c/g
         kCVxM5I8FwJq3qbOjkoqX2BBG6r0P7gYYLV221pB0+LcPP3RA5eTE7WJkm3qTX3WmYaG
         LwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/17f+DzetPf5Wbn+q3zaaJ9PFuWaNoMs35ocYvK/NiU=;
        b=DQNWmVXli3b0V9Wh3RynMJ9AIDe6221IPrNPQJVdAv98QXMIeYyWGCfosyMa6MV05p
         7rvs98tbTSlS+98jwSOxLdIHnOWMWXIwlha/XOa30T6dZPhfB6SBqd8Db6dOqCn1vZ1j
         sQIvLn6TDhHbwfhNCDEPHXiCVUq9H6YuanjT6Ag3rhxYIJqsOJAVqjpS6wAF3RScRa1Z
         LajRvwHC51yKMHuROaF2mWaLQ7ZMQeQuKKg1yc1re+n2ykJWIqWjQ2mDaOfZgds9rPWE
         2UFrLyrMk3IIGam84pElN4ALtM73sUMto2fU/j0pYbTaDXH5K2j8AcCvw3NkWPkONUcQ
         NPrA==
X-Gm-Message-State: AO0yUKVOfLBkQUhNkbHpMzmVbVTcnBuPLFRmCmbaFPj9g6DBAaeCM9BE
	ew82qaB/oD25rOB2K+kI2eU=
X-Google-Smtp-Source: AK7set9l9NflyM40DhEq/AoNiBJJJc/LSf+EqEm0YORdySMYYlmJt6maQUBDxtXDqTsqb7F1RsK03Q==
X-Received: by 2002:a17:903:24e:b0:19c:32b1:185d with SMTP id j14-20020a170903024e00b0019c32b1185dmr7491470plh.39.1677008085520;
        Tue, 21 Feb 2023 11:34:45 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:30ba:90e9:a2f2:4b50])
        by smtp.gmail.com with ESMTPSA id ji11-20020a170903324b00b0019afb7a02a1sm9997472plb.218.2023.02.21.11.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 11:34:44 -0800 (PST)
Date: Tue, 21 Feb 2023 11:34:41 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: ye.xingchen@zte.com.cn
Cc: hdegoede@redhat.com, wens@csie.org, jernej.skrabec@gmail.com,
	samuel@sholland.org, linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: =?iso-8859-1?Q?sun4i-lr?=
 =?iso-8859-1?Q?adc-keys_-_Use=A0devm=5Fplatform=5Fioremap=5Fresource=28?=
 =?iso-8859-1?Q?=29?=
Message-ID: <Y/Uc0SMFUmgtjkcH@google.com>
References: <202302171036375639285@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202302171036375639285@zte.com.cn>

On Fri, Feb 17, 2023 at 10:36:37AM +0800, ye.xingchen@zte.com.cn wrote:
> From: Ye Xingchen <ye.xingchen@zte.com.cn>
> 
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to Use devm_platform_ioremap_resource(), as this is exactly
> what this function does.
> 
> Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>

Applied, thank you.

-- 
Dmitry
