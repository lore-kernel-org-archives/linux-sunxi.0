Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBF11DDD5;
	Fri, 22 Sep 2023 08:15:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2800BC433C9;
	Fri, 22 Sep 2023 08:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695370533;
	bh=8ABIlKjkFIE6A7vWtZDkj2Hr1hp4Z0j+R3tTY7dVFQs=;
	h=From:To:Cc:Subject:Date:From;
	b=VFuw+uhOP2N0/zan3oa17woYzRuGd+FPLCXoTXiv3gsVAaXvgk3ViZUZtvWSe+j0r
	 9SmsTStYjus2hcPKQk8kZ3FVOBgtTQRjiE1SQv/eWZRKfrwrE1blrQh2qZHlbFhddm
	 4HsJgYS7cULTnO3veIK52Np3pgU9qLQ3flKNekOLNuSCgh57DSufUvnLxKye7Jw/zu
	 40YaSBWREDmc3AxmmbqxWVOrj0k7fCo4vsfvQUWz5p15xxa7OEdafYaGay8ajIy7mF
	 fuLTMh7hJHehg/bqaf+DdZPh7P1IOZ2VeHTRAknlPnhpwGKiqW2unS/OTKdH941Bya
	 Bm6SLgm7kUTsQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org
Subject: [RFC v2 0/6] riscv,isa-extensions additions
Date: Fri, 22 Sep 2023 09:13:45 +0100
Message-ID: <20230922081351.30239-2-conor@kernel.org>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

I'm suffering from a hw failure on my main dev machine & relegated to a
recently acquired & not really configured laptop for a bit, so hopefully
nothing with this series goes awry. (rfc v2: I think my board farm might
actually have been the source of the failure - I did hear a large pop
when I turned it on the day before the thing started not booting.
Motherboard seems to be kaput!)

I've had two (or more, dunnno) people ask me where the patches for the
DTs were swapping them over, so here's what I had before the hw failure.
I've marked this RFC as a result & I'd like to come back and revisit
these patches once I'm out of this limited environment.
This "RFC v2" just fixes the silly issue that was pointed out by Chen
Wang & the patchwork automation, where I used the wrong property name
everywhere.

The canaan stuff is absent here, mostly because I don't actually know
what to do with it. They don't actually implement the same versions of
the F stuff as everyone else (Stefan O'Rear pointed that out to me
somewhere recently).

Cheers,
Conor.

CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Albert Ou <aou@eecs.berkeley.edu>
CC: Chen-Yu Tsai <wens@csie.org>
CC: Jernej Skrabec <jernej.skrabec@gmail.com>
CC: Samuel Holland <samuel@sholland.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Magnus Damm <magnus.damm@gmail.com>
CC: Emil Renner Berthing <kernel@esmil.dk>
CC: Jisheng Zhang <jszhang@kernel.org>
CC: Guo Ren <guoren@kernel.org>
CC: Fu Wei <wefu@redhat.com>
CC: Chen Wang <unicorn_wang@outlook.com>
CC: devicetree@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: linux-sunxi@lists.linux.dev
CC: linux-renesas-soc@vger.kernel.org

Conor Dooley (6):
  riscv: dts: microchip: convert isa detection to new properties
  riscv: dts: sifive: convert isa detection to new properties
  riscv: dts: starfive: convert isa detection to new properties
  riscv: dts: renesas: convert isa detection to new properties
  riscv: dts: allwinner: convert isa detection to new properties
  riscv: dts: thead: convert isa detection to new properties

 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi |  3 +++
 arch/riscv/boot/dts/microchip/mpfs.dtsi       | 15 +++++++++++++++
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi   |  3 +++
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi    | 15 +++++++++++++++
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi    | 15 +++++++++++++++
 arch/riscv/boot/dts/starfive/jh7100.dtsi      |  6 ++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 15 +++++++++++++++
 arch/riscv/boot/dts/thead/th1520.dtsi         | 12 ++++++++++++
 8 files changed, 84 insertions(+)

-- 
2.41.0

