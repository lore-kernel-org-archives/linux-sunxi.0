Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F3272
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Jun 2021 17:38:39 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id d9so82532ioo.2
        for <linux-sunxi@lists.linux.dev>; Wed, 16 Jun 2021 10:38:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=caREsov+kQL6hsFHbO3qE0x8vyqeon2R6xoJZTCN1nE=;
        b=mBUiGJUpgwnQxT0K81DyE0OLRxACwoOl3TFWJqGenm5/tSPLX/Kj/hdpJY6u30Qvoh
         5PQSFg8dBOJ7tG5D4pUhPC0ha3eXMQpz8e53GgY5vhVqDmwL+/oPOz1Xe/eqzCAmnXxf
         oWFtNURcCICKmizwEVjxOsb/w6PxIOLfL6dOurLO3+Gj4WZu4aopP8lGzjqnWGzA5z4T
         y5E7qzjibKdA1dTJF/rbBfQ1cp005ZNLqsTVfcTmnBg7StG8v4Ho1Wo2225wXN/eSSwC
         kLMYawThOakeZ0xkww1uAH5MGrieFDmD/Sh8TBG811vumYEdOvTUCL1R+b1+zDsJCZEp
         szgw==
X-Gm-Message-State: AOAM533zbgAxnvxWG5cBkzEV4hIYVu2l23UDZZmQRAmZcZNBLSHy/fV1
	8rVwjogrR3NMxQd2nDRygw==
X-Google-Smtp-Source: ABdhPJynatIw6jCXNfKjoGqcXEFsUQJLV+Gn1TbMCCbvi4TDEe/Ax2zuZwJOXxkzisoOzndoBlEIJw==
X-Received: by 2002:a02:956a:: with SMTP id y97mr526313jah.58.1623865118791;
        Wed, 16 Jun 2021 10:38:38 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id h7sm1400430ila.5.2021.06.16.10.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 10:38:37 -0700 (PDT)
Received: (nullmailer pid 3592754 invoked by uid 1000);
	Wed, 16 Jun 2021 17:38:35 -0000
Date: Wed, 16 Jun 2021 11:38:35 -0600
From: Rob Herring <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>, linux-sunxi@lists.linux.dev, linux-sunxi@googlegroups.com, Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org, Ondrej Jirman <megous@megous.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org, Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH v7 17/19] dt-bindings: arm: sunxi: Add two H616 board
 compatible strings
Message-ID: <20210616173835.GA3592707@robh.at.kernel.org>
References: <20210615110636.23403-1-andre.przywara@arm.com>
 <20210615110636.23403-18-andre.przywara@arm.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210615110636.23403-18-andre.przywara@arm.com>

On Tue, 15 Jun 2021 12:06:34 +0100, Andre Przywara wrote:
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
