Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5390C53B8
	for <linux-sunxi@lists.linux.dev>; Tue, 16 Aug 2022 17:35:42 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id z8so5735168ile.0
        for <linux-sunxi@lists.linux.dev>; Tue, 16 Aug 2022 10:35:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=RnoAucd176W+o4ETJ7P9jHc6+1EKnkGk1HGPAZBXuwk=;
        b=A0oysR3MByBH2VnDR9B7ZHn6DhPI+keZwoitnHp0QG1s2ipGXxB+q0JV+Z2091nRXH
         u8JYNt8d+WQeC7w5hjCL//xwaMKPHD88xXBuVFC5pd13Ku8XCE0TXbIEuBEJNKzIuJsW
         JIQln3Fp6hIcYMJLgSAczJ4mb41KU3mpoUpM51SdnNkyj4VAAaQ8nzP9kmG4022PjsW1
         v5+3FBuDLPgY4ZN1M0j4/uWyaJJITuQHYEGr/jTv4RUH1tjFDmOiv+l9zEC4/9o1D9zA
         ljJj5NsxuOmlilytLCPJPfiM7HnVdSX7t0bXW6qOxpD55tk8eetm93zRDjEDDe5S+bVE
         pHaQ==
X-Gm-Message-State: ACgBeo2CY3xH/5d4XWmX4yI9mf0D1yHoqFgmLpGPKEST2Ef92fBEuGGq
	awaQyhGBceFfqQm7ZpLs/Q==
X-Google-Smtp-Source: AA6agR6SitkaJDU9fxs/PoyypEjRtrIRm+X9J1OjRamGhN+UfpSsRZky+nrmJnLwNAwcNtebknW+QA==
X-Received: by 2002:a92:cda3:0:b0:2e3:e214:5fa5 with SMTP id g3-20020a92cda3000000b002e3e2145fa5mr9293291ild.306.1660671341354;
        Tue, 16 Aug 2022 10:35:41 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id f28-20020a056602071c00b00688b5bd70dcsm1081734iox.8.2022.08.16.10.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 10:35:40 -0700 (PDT)
Received: (nullmailer pid 2427019 invoked by uid 1000);
	Tue, 16 Aug 2022 17:35:39 -0000
Date: Tue, 16 Aug 2022 11:35:39 -0600
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH 04/12] dt-bindings: riscv: Add Allwinner D1 board
 compatibles
Message-ID: <20220816173539.GA2426958-robh@kernel.org>
References: <20220815050815.22340-1-samuel@sholland.org>
 <20220815050815.22340-5-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220815050815.22340-5-samuel@sholland.org>

On Mon, 15 Aug 2022 00:08:07 -0500, Samuel Holland wrote:
> Several SoMs and boards are available that feature the Allwinner D1 SoC.
> Document their compatible strings.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  .../devicetree/bindings/riscv/sunxi.yaml      | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/sunxi.yaml
> 

Acked-by: Rob Herring <robh@kernel.org>
