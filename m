Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3007EEDC
	for <linux-sunxi@lists.linux.dev>; Sun, 24 Dec 2023 21:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RfhGHK5K"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d3fde109f2so262795ad.1
        for <linux-sunxi@lists.linux.dev>; Sun, 24 Dec 2023 13:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1703453645; x=1704058445; darn=lists.linux.dev;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=19k96QXnbMagvx60gm9Q3bYlRQY8OEapphIAobKuCbg=;
        b=RfhGHK5KOO9aeWMpXlp7KUN7/Q6E3F+O3yoN1m5uS7PtgVy6qqAupxhbxrS1KExg6Y
         OJWfO9833e/ggYHJbpx0IWUs8Tzr7fZyxmjrB0OYTebYX4nronu82BTR96K/yNEreBTm
         8nFfa2czsRLs6VhrN/fcKCqYrHHJrhDxHDwnrpsB9VuLz1GSdcMEp2RrrV5Bu/Y6Zcf1
         SUxqGMGSqLG01g0STwbVOBdRX196LePoo9oWJp6jnSh8tCj5TuS+31ky77hqF3SMqZQz
         cj3lhhNFywupmiegqQH6Q1hjsklC3UECqj5JKVSzuNO2OTXn3lOsaLO4um0HZTOcRIfz
         xk8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703453645; x=1704058445;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=19k96QXnbMagvx60gm9Q3bYlRQY8OEapphIAobKuCbg=;
        b=Up2//qJgLNJ+kwzL9tPb0gZdKa0xj23JazktLRV8FhZaFGxxfNHnB7reAZoaseNSKh
         y/PK5UgEMZwbknBgUO6sh4zvCpIrN5vCMOKDjVjb1DOojEho3KZao/QPQWct1w7NO+Wu
         1miUYN1MRPI6SmJaet88ZhuwwAmHkTLv055q26R+OsUBjSPb6k6Djr6AT32olvP0wTLi
         NSARywWSQFFq+bs4o9s96hAvmoT2RH31byMyvZTn6xFn1O/XF6BjNkKZkyciz7qGxHHz
         MYP/nzFsirXjZTloW6UFU214J+KRjcuyXtwbadp01PDRhbiq5d4+t2qVWGt3Ui9vNId6
         aKng==
X-Gm-Message-State: AOJu0YzlX1NitT1UKjwC+HeYxePsFYtyoY4fQvIC0L9Knj28IILSxn/7
	38LiD2OOC9JCwxQpEIVwJTwyFZovXbZs
X-Google-Smtp-Source: AGHT+IGegIDK1SiERqRo6gqK2h3wZ3T0rNk/SXpnhPjqekqQBeNJ+EefZk9MMaDh4fgCcjIJBnmJeg==
X-Received: by 2002:a17:903:1248:b0:1d4:cae:9a03 with SMTP id u8-20020a170903124800b001d40cae9a03mr251305plh.23.1703453645061;
        Sun, 24 Dec 2023 13:34:05 -0800 (PST)
Received: from [2620:0:1008:15:c723:e11e:854b:ac88] ([2620:0:1008:15:c723:e11e:854b:ac88])
        by smtp.gmail.com with ESMTPSA id n7-20020a056a000d4700b006d9bbc8d785sm400894pfv.141.2023.12.24.13.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Dec 2023 13:34:04 -0800 (PST)
Date: Sun, 24 Dec 2023 13:34:03 -0800 (PST)
From: David Rientjes <rientjes@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
cc: akpm@linux-foundation.org, alim.akhtar@samsung.com, alyssa@rosenzweig.io, 
    asahi@lists.linux.dev, baolu.lu@linux.intel.com, bhelgaas@google.com, 
    cgroups@vger.kernel.org, corbet@lwn.net, david@redhat.com, 
    dwmw2@infradead.org, hannes@cmpxchg.org, heiko@sntech.de, 
    iommu@lists.linux.dev, jernej.skrabec@gmail.com, jonathanh@nvidia.com, 
    joro@8bytes.org, krzysztof.kozlowski@linaro.org, linux-doc@vger.kernel.org, 
    linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-mm@kvack.org, linux-rockchip@lists.infradead.org, 
    linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
    linux-tegra@vger.kernel.org, lizefan.x@bytedance.com, marcan@marcan.st, 
    mhiramat@kernel.org, m.szyprowski@samsung.com, paulmck@kernel.org, 
    rdunlap@infradead.org, robin.murphy@arm.com, samuel@sholland.org, 
    suravee.suthikulpanit@amd.com, sven@svenpeter.dev, 
    thierry.reding@gmail.com, tj@kernel.org, tomas.mudrunka@gmail.com, 
    vdumpa@nvidia.com, wens@csie.org, will@kernel.org, yu-cheng.yu@intel.com
Subject: Re: [PATCH v2 02/10] iommu/amd: use page allocation function provided
 by iommu-pages.h
In-Reply-To: <20231130201504.2322355-3-pasha.tatashin@soleen.com>
Message-ID: <56409bdf-3f9d-e521-814f-3c8e854db3bf@google.com>
References: <20231130201504.2322355-1-pasha.tatashin@soleen.com> <20231130201504.2322355-3-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 30 Nov 2023, Pasha Tatashin wrote:

> Convert iommu/amd/* files to use the new page allocation functions
> provided in iommu-pages.h.
> 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Acked-by: David Rientjes <rientjes@google.com>

Although any feedback from Suravee and Joerg would be very useful on the 
overall approach and whether this looks good to them.
