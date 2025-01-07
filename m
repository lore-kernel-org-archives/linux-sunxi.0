Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADABA1E3DC5
	for <linux-sunxi@lists.linux.dev>; Tue,  7 Jan 2025 14:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736261695; cv=none; b=MX9Z+iVAf5r5H758AvxPRb0/UZicB05o2G+NeWD+c4lNzQiOUfDI3hXk5WDzrjNbvSSBPfrObnB3LtvoSwBhwU9Q0NtXSb/ouA8FPeats0Vfa92bEKajLVimHtiXkiqZCtaaY5eFTKDygkxaldS4z/Y0CR8aOidCMEzdYIcObrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736261695; c=relaxed/simple;
	bh=VBHQV+/gU2eK8sKIAscAjkMxOOakYjY7hMpg8oS4Gsg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sDKe2mwUS9+iTanhgWES8ve1eUEAFfmS1wO4pVihMifp5dVKCMRjyEE5VB+Nctt9RlrnZw6frTs5KcI6h1mvOQjzIIc9ObzFOogfBdSbzz26PD8nhKar4w28uMwUtGvacNJRcqumoEX7E05iOLw01j8c6RjJJ4Uy1al5pksSC2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 536511424;
	Tue,  7 Jan 2025 06:55:19 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E5B7F3F673;
	Tue,  7 Jan 2025 06:54:48 -0800 (PST)
Date: Tue, 7 Jan 2025 14:54:46 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: vendor-prefixes: Add NetCube
 Systems Austria name
Message-ID: <20250107145446.16a8a4ea@donnerap.manchester.arm.com>
In-Reply-To: <20250106190703.4015-2-lukas.schmid@netcube.li>
References: <20250106190703.4015-1-lukas.schmid@netcube.li>
	<20250106190703.4015-2-lukas.schmid@netcube.li>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  6 Jan 2025 19:06:59 +0000
Lukas Schmid <lukas.schmid@netcube.li> wrote:

> NetCube Systems Austria builds Embedded Systems for use in IoT, IIoT,
> or Smart Home scenarios.
> 
> Website is still WIP, but the Links on it are active:
> https://netcubesystems.at/
> 
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>

Just to give some more guidance on when to drop tags and when to not:
If you are making real changes to the code, then it might be indicated to
drop the tag, since the patch might not be anymore what the reviewer
acknowledged.
But if you are just fixing (especially improving/adding to) the commit
message, or fixing some typo, then you keep the tag, to reduce the churn
and avoid extra work again from the reviewer.
This is sometimes not easy to decide, say for instance: is renaming a
variable something covered by the tag? The new name might be worse or
misleading, even though the code didn't really change.

But in this case it's pretty clear that Krzysztof is surely fine with you
adding extra info to the commit message, and the actual patch didn't
change at all, so keeping his tag would be a good thing.

If you are in doubt, then it's often good to drop the tag *and* point this
out, for instance in the cover letter, like: "Krzysztof, I changed this
and that in patch 1/4, so I dropped your tag."

Cheers,
Andre

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index da01616802c7..a30ed9547098 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1027,6 +1027,8 @@ patternProperties:
>      description: Neofidelity Inc.
>    "^neonode,.*":
>      description: Neonode Inc.
> +  "^netcube,.*":
> +    description: NetCube Systems Austria
>    "^netgear,.*":
>      description: NETGEAR
>    "^netlogic,.*":

