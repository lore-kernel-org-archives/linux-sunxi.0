Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C4F2099E
	for <linux-sunxi@lists.linux.dev>; Fri,  9 Jun 2023 20:26:24 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-30aea656e36so1577645f8f.1
        for <linux-sunxi@lists.linux.dev>; Fri, 09 Jun 2023 13:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686342382; x=1688934382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZvA/3fbhD0ZlZP2eZsPZEPlg+aDPhGDa3Vr2v+kNLw=;
        b=Y5fWnSP4/lzEi2Pvl7jUd8iq0SzWVhCiuv41xtc+6bY2KuJzHzubdFYB/sXNzgiWKg
         55zo/jY4nc0EEA9Co48v2T6WiWSXyxnOjdUhVe0PHHxkXU1hRdyJeyFMqmVCPFAnuYXp
         NOJyRB+LZQapNZ2dvGSYPimailSGiet+ct8QtHmjilQODBqhlsGhUp5wEC5pwz/48BK/
         1rlGEuLh8vL6S4aHWWP4mVBRyoCjR0MfFIokpN+zUWaIdkInfIY1T1pSvtjhLh0IqtUs
         J2qVECRYBfUEb+W4SrDiFFK/CjN/TOkTsNacoskfqsI0ceKzb1LkGHy3QWhvSLKub2lM
         b1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686342382; x=1688934382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EZvA/3fbhD0ZlZP2eZsPZEPlg+aDPhGDa3Vr2v+kNLw=;
        b=XwEu4RD+k6mXG5beL2PArKd7w/+qVFYH318tJm0Vddz/WDzn3JKyEVriTyqwoZIz6q
         pSB2uPRUno3wNJnuf9HuFQ3oUktaObzD2T4pZ+kC2HWyotikMZ7jNZgzJZlhLwDJ1Z2D
         bWLdUdg0Wf+MKJsQyOBc3jUYMDzmi6qw0IkWnBQofzlNX6WQJF0HoftG2FKhduh38YIR
         J8HgJkOnsk0h+euFRN9xmHW9OL6oE91Lo3j1kKz5e7+n5lbRSvhkjn08d+KBywpos9Ge
         C12UqroF7V/3aSZ5PaOz3TiY569FxpsvJGfsZTsp1ktTB18T/xP05f4supLlUZw/u+6e
         jvGg==
X-Gm-Message-State: AC+VfDz1yfmcTkXARyLbVJLW7s0igiR1x7/VxtD2L7jU4WnErrSUT2J4
	wSn0a1Et46x7RTkIqkzO8AI=
X-Google-Smtp-Source: ACHHUZ53TC4YnpMn6/PYjOs/A4zgdRb9nuqxbGor7Pus7ebc0Z/s9VGheL2EiyyJAIuhZ/T40M+heg==
X-Received: by 2002:adf:f6cd:0:b0:30e:3eaa:19e with SMTP id y13-20020adff6cd000000b0030e3eaa019emr1513304wrp.16.1686342382316;
        Fri, 09 Jun 2023 13:26:22 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id v18-20020a5d43d2000000b0030ae93bd196sm5289477wrr.21.2023.06.09.13.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 13:26:22 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
 Mikhail Kalashnikov <iuncuim@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Samuel Holland <samuel@sholland.org>, Icenowy Zheng <uwu@icenowy.me>,
 Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 3/5] sunxi: H616: dram: split struct dram_para
Date: Fri, 09 Jun 2023 22:26:21 +0200
Message-ID: <4810216.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <20230607000745.10245-4-andre.przywara@arm.com>
References:
 <20230607000745.10245-1-andre.przywara@arm.com>
 <20230607000745.10245-4-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sreda, 07. junij 2023 ob 02:07:43 CEST je Andre Przywara napisal(a):
> Currently there is one DRAM parameter struct for the Allwinner H616 DRAM
> "driver". It contains many fields that are compile time constants
> (set by Kconfig variables), though there are also some fields that are
> probed and changed over the runtime of the DRAM initialisation.
> 
> Because of this mixture, the compiler cannot properly optimise the code
> for size, as it does not consider constant propagation in its full
> potential.
> 
> Help the compiler out by splitting that structure into two: one that only
> contains values known at compile time, and another one where the values
> will actually change. The former can then be declared "const", which will
> let the compiler fold its values directly into the code using it.
> 
> We also add "const" tags for some new "struct dram_config" pointers, to
> further increase code optimisation.
> To help the compiler optimise the code further, the definition of the
> now "const struct dram_para" has to happen at a file-global level, so
> move that part out of sunxi_dram_init().
> 
> That results in quite some code savings (almost 2KB), and helps to keep
> the code small with the LPDDR3 support added later.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Nice trick. It could be used also in other DRAM drivers.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


