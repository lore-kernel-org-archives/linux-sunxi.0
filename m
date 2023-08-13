Received: from out-99.mta1.migadu.com (out-99.mta1.migadu.com [95.215.58.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEFF15BF
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Aug 2023 06:17:08 +0000 (UTC)
Date: Sun, 13 Aug 2023 16:16:40 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1691907425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qGW+uEtQIIiysgEl4d9oH5pQEw9oqmQWs9ZMkCRYRdg=;
	b=tYs+F4/7NlUNIjNBlMNFZeFTyU4zkuLFdyt1mSh2AcPir3KGnaEsZ86DOtOF7rfyRUEyo4
	JCue7/Tc1C6asomXlKZ5uR4db7svbba65M8FgzmnkXWTZCe+qVhTkprcepOVrwkpUQN0jw
	Ee1m/redEKiHt7mql3UekWoqKKo/pCaApbHC2Vue81crqfEbhP6LWCXHssm6EG427x7KWx
	bmc1fwoOYIqxqdgjAY0kfx5ZD62AQLhELM1nVrHBmLBQnkDzDvek5Vbpbp5HT/clHJj26o
	i8K0tx1pQQzpwmeOP9cLBN7fAbwBLlqAj7b6jMN8huaTC2LNWncN7Fl0Bzj4uQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: John Watts <contact@jookia.org>
To: Chen-Yu Tsai <wens@csie.org>
Cc: linux-sunxi@lists.linux.dev, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] riscv: dts: allwinner: d1: Add CAN controller nodes
Message-ID: <ZNh1SJakNFqPLrwa@titan>
References: <20230807191952.2019208-1-contact@jookia.org>
 <CAGb2v66vqrNZ-ga-1O_bQ16BWXH=RmSHo2Kb+WHJyw-Nm1kWVg@mail.gmail.com>
 <ZNhau0j_tV3EXGxl@titan>
 <CAGb2v647FoATnjk43GKqVihX-FtZN+7XrxMMRseuqap0MBg2FQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGb2v647FoATnjk43GKqVihX-FtZN+7XrxMMRseuqap0MBg2FQ@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Sun, Aug 13, 2023 at 02:14:42PM +0800, Chen-Yu Tsai wrote:
> Applied. Please check here:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git/commit/?h=sunxi/dt-for-6.6&id=f05af44f691351bfd954f39ec376666dc5e1b869

Looks good to me. Thank you.
