Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF8C70
	for <linux-sunxi@lists.linux.dev>; Tue, 30 Mar 2021 10:13:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABF11ED1;
	Tue, 30 Mar 2021 03:13:51 -0700 (PDT)
Received: from bogus (unknown [10.57.57.89])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A0BF3F792;
	Tue, 30 Mar 2021 03:13:50 -0700 (PDT)
Date: Tue, 30 Mar 2021 11:13:40 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-sunxi@googlegroups.com
Subject: Re: [RFC PATCH] arm64: dts: allwinner: a64/h5: Add CPU idle states
Message-ID: <20210330101330.eaanzt5f3bhsn7df@bogus>
References: <20210322062514.40747-1-samuel@sholland.org>
 <20210323015627.08f9afd6@slackpad.fritz.box>
 <ca26bade-abab-8e01-8014-bc7c72ea13fc@sholland.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca26bade-abab-8e01-8014-bc7c72ea13fc@sholland.org>
User-Agent: NeoMutt/20171215

On Tue, Mar 23, 2021 at 11:44:50PM -0500, Samuel Holland wrote:
> 3) Modify the Linux PSCI client to respect PSCI_FEATURES when setting
>    psci_ops.cpu_suspend. cpuidle-psci checks for this function before
>    setting up idle states.

We don't call PSCI_FEATURES on mandatory functions as it may not return
anything meaningful for such mandatory functions(as that is not mandated
in the spec). In short NACK to add PSCI_FEATURES check for mandatory
functions.

--
Regards,
Sudeep
